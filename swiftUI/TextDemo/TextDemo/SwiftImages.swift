//
//  SwiftImages.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SwiftImages: View {
    var body: some View {
        Image("salman")
        // with rendering mode we can fill the color to the image with 'foregroundColor'
        // we can set this 'renderingMode' property from xcode as well by choosing this image
//            .renderingMode(.template) // this propety I set through xcode
            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .scaledToFit()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.gray)
//            .clipped() // for fill we can use
//            .cornerRadius(150)
        // Insead of using corner radius better to use 'clipShape'
//            .clipShape(
//                /*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/
//                RoundedRectangle(cornerRadius: 25.0)
//                Ellipse()
//            )
    }
}

#Preview {
    SwiftImages()
}
