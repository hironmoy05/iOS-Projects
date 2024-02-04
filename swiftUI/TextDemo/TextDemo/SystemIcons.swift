//
//  SwiftIcons.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SystemIcons: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
//            .font(.largeTitle)
//            .font(.system(size: 200))
        // If we use the frame to give the size then we'll have to use 'resizable' to make things work
            .resizable()
        
//            .aspectRatio(contentMode: .fill)
        // also we can use this fuction instead of aspectRation()
//            .scaledToFill()
        // or
            .scaledToFit()
            .frame(width: 300, height: 300)
//            .foregroundColor(.red)
//            .clipped() // won't go out of frame, if we're using 'scaleToFill'
    }
}

#Preview {
    SystemIcons()
}
