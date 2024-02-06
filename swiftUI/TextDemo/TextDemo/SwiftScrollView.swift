//
//  SwiftScrollView.swift
//  TextDemo
//
//  Created by Gaurav Sara on 06/02/24.
//

import SwiftUI

struct SwiftScrollView: View {
    var body: some View {
//        ScrollView(.vertical, content: {
//            VStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                }
//            }
//        })
//        .scrollIndicators(.hidden)
        
//        ScrollView(.horizontal, content: {
//            HStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 200, height: 200)
//                        .cornerRadius(40)
//                }
//            }
//        })
//        .scrollIndicators(.hidden)
        
        ScrollView {
            LazyVStack {
                ForEach(0..<1000, id: \.self) { index in
                    ScrollView(.horizontal, content: {
                        LazyHStack {
                            ForEach(0..<20000, id: \.self) { index in
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 15, x: 0.0, y: 0.0)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    SwiftScrollView()
}
