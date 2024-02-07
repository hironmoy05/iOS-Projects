//
//  SwiftButton.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct customButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, -1)
            .foregroundStyle(.white)
            .background(.blue)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: configuration.isPressed ? 7 : 10)
    }
}

struct SwiftButton: View {
    @State var title: String = "Title"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            Button {
                self.title = "Button was clicked"
                
//                withAnimation {
//                    self.isClicked.toggle()
//                }
            } label: {
                // We can customize here
                HStack {
                    Image(systemName: "map")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                    Text("Click me")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .padding()
            }
            .buttonStyle(customButtonStyle())
            
            Spacer()
                .frame(height: 50)
            Button("Click again") {
                title = "Button was again clicked"
            }
            
            Button {
                self.title = "Button #3"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 74)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                    )
            }
        }
    }
}

#Preview {
    SwiftButton()
}
