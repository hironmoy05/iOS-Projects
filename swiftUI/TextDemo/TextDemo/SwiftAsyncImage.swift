//
//  SwiftAsyncImage.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

//case empty -> No image is loaded.
//case success(Image) -> An image succesfully loaded.
//case failure(Error) -> An image failed to load with an error.

struct SwiftAsyncImage: View {
    let url = URL(string: "https://cdn.pixabay.com/photo/2016/05/10/21/50/meditation-1384758_1280.jpg")
    
    var body: some View {
//        AsyncImage(url: url, content: { returnedImage in
//            returnedImage
//                .resizable()
//                .scaledToFill()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//        }, placeholder: {
//            ProgressView()
//        })
        
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                // Displays the loaded image.
                   image
                    .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
               } else if phase.error != nil {
                   Image(systemName: "questionmark")
                        .font(.largeTitle)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .background(.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
               } else {
                   // Acts as a placeholder.
                   Image(systemName: "questionmark")
                       .font(.title)
                       .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                       .background(.gray.opacity(0.5))
                       .clipShape(RoundedRectangle(cornerRadius: 20))
               }
            
//            switch phase {
//            case .empty:
//                ProgressView()
//            case .success(let image):
//                image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            case .failure:
//                Image(systemName: "questionmark")
//                    .font(.headline)
//            @unknown default:
//                Image(systemName: "questionmark")
//                    .font(.headline)
//            }
        }
    }
}

#Preview {
    SwiftAsyncImage()
}
