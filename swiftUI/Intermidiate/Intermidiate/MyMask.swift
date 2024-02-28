//
//  MyMask.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 28/02/24.
//

import SwiftUI

struct MyMask: View {
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader() { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
//                    .foregroundStyle(.yellow)
                    .fill(LinearGradient(colors: [Color.red, Color.green, Color.blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
//                    .foregroundStyle(rating >= index ? .yellow : .gray)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MyMask()
}
