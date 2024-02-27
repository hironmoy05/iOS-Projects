//
//  MyDragGesture2.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 27/02/24.
//

import SwiftUI

struct MyDragGesture2: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.84
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignupView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
    }
}

#Preview {
    MyDragGesture2()
}

struct MySignupView: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Image(systemName: "chevron.up")
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("This is the description for our app. This is my favorite SwiftUI course and I recommed to all of my friends!")
                    .multilineTextAlignment(.center)
                
                Text("Create an Account")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
        }
        .padding()
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}
