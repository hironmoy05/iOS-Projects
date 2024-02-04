//
//  SwiftPadding.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SwiftPadding: View {
    var body: some View {
//        Text("Hello World!" )
//            .background(.yellow)
//            .padding()
        // longer version of padding
//            .padding(.all, 16)
//            .padding(.vertical, 10)
//            .padding(.vertical, 10)
//            .padding(.all, 16)
//            .padding(.leading, 10)
//            .background(.blue)
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading, 16 )
//            .background(.red)
        
        VStack (alignment: .leading) {
            Text("Hello World!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("This is the description of what we will do on tis screen. It is multiple lines and we will align the text to the leading edge.")
//                .multilineTextAlignment(.leading) // Default setting of the text
//                .padding(.leading, 16)
        }
//        .background(.yellow)
//        .padding()
//        .background(.red)
//        .padding(.horizontal, 16)
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
//                .cornerRadius(10)
                .presentationCornerRadius(CGFloat(20))
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 10,
                    x: 0.0,
                    y: 10
                )
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    SwiftPadding()
}
