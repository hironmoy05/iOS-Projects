//
//  MagnificationGesture.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 26/02/24.
//

import SwiftUI

struct MyMagnificationGesture: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("SwiftFul Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                currentAmount = 0
                            }
                        }
                )
            
            Group {
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                }
                .font(.headline)
                
                Text("This is the caption for my photo!")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(.horizontal)
        }
        
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .scaleEffect(1.0 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

#Preview {
    MyMagnificationGesture()
}
