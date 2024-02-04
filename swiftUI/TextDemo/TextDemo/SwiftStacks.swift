//
//  SwiftStacks.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SwiftStacks: View {
    var body: some View {
//        VStack {
//             Rectangle()
//                .fill(.orange)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//            
//            Rectangle()
//               .fill(.blue)
//               .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//            
//            Rectangle()
//               .fill(.green)
//               .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//        }
        
//        VStack (alignment: .leading, spacing: 0, content: {
//                 Rectangle()
//                    .fill(.orange)
//                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
//                    .frame(width: 200, height: 200)
//                
//                Rectangle()
//                   .fill(.blue)
//                   .opacity(0.7)
//                   .frame(width: 150, height: 150)
//                
//                Rectangle()
//                   .fill(.green)
//                   .opacity(0.7)
//                   .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//        })
        
//        HStack (alignment: .bottom, spacing: nil, content: {
//                 Rectangle()
//                    .fill(.orange)
//                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
//                    .frame(width: 200, height: 200)
//                
//                Rectangle()
//                   .fill(.blue)
//                   .opacity(0.7)
//                   .frame(width: 150, height: 150)
//                
//                Rectangle()
//                   .fill(.green)
//                   .opacity(0.7)
//                   .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//        })
        
//        ZStack (alignment: .leading , content: {
//                 Rectangle()
//                    .fill(.orange)
//                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
//                    .frame(width: 200, height: 200)
//                
//                Rectangle()
//                   .fill(.blue)
//                   .opacity(0.7)
//                   .frame(width: 150, height: 150)
//                
//                Rectangle()
//                   .fill(.green)
//                   .opacity(0.7)
//                   .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//        })
//        ZStack (content: {
//            Rectangle()
//                .fill(.green)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                .position(x: 270, y: 100)
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 100, height: 100)
//                .position(x: 180, y: 100)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//                .position(x: 90, y: 100)
//        })
//        .frame(width: 300, height: 200)
//        .background(.red)
        
//        ZStack (alignment: .top) {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500)
//                
//            VStack(alignment: .leading) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//                
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100, height: 100)
//                
//                HStack(alignment: .bottom) {
//                    Rectangle()
//                        .fill(.purple)
//                    .frame(width: 50, height: 50)
//                    
//                    Rectangle()
//                        .fill(.pink)
//                    .frame(width: 75, height: 75)
//                    
//                    Rectangle()
//                        .fill(.blue)
//                    .frame(width: 25, height: 25)
//                }
//                .background()
//            }
//            .background(.black)
         
//        HStack (alignment: .bottom) {
//            Text("Items in your cart:")
//                .font(.caption)
//                .foregroundStyle(.gray)
//            Text("5")
//                .font(.largeTitle)
//        }
//        VStack (alignment: .center) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            Text("Items in your cart:")
//                .font(.caption)
//                .foregroundStyle(.gray)
//        }
        
        VStack (spacing: 50) {
            ZStack (alignment: .center) {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("14")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            
            Text("14")
                .font(.title)
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

#Preview {
    SwiftStacks()
}
