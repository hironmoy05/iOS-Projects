//
//  SwiftBackgroundAndOverlay.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SwiftBackgroundAndOverlay: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(
////                .red
////                LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing)
//                Circle()
////                    .fill(.blue)
//                    .fill(
//                        LinearGradient(colors: [.red, .blue, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    )
//                    .frame(width: 100, height: 100, alignment: .center)
//            )
//            .background(
//                Circle()
////                    .fill(.red)
//                    .fill(
//                        LinearGradient(colors: [.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    )
//                    .frame(width: 120, height: 120, alignment: .center)
//            )
        
//        Circle()
//            .fill(.pink)
//            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
//            .overlay(
//                Text("14")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundStyle(.white)
//            )
//            .background(
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 120, height: 120)
//            )
        
//        Rectangle()
//            .fill(.blue)
//            .frame(width: 100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 50, height: 50)
//                , alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(.purple)
//                    .frame(width: 140, height: 140)
//                , alignment: .bottomTrailing
//            )
        
        // Real world example
        Image(systemName: "heart.fill")
            .font(.system(size: 50))
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(red: 0.8, green: 0.4, blue: 0.9), radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("14")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            )
                            .shadow(color: Color(red: 0.8, green: 0.4, blue: 0.9), radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing
                    )
            )
    }
}

#Preview {
    SwiftBackgroundAndOverlay()
}
