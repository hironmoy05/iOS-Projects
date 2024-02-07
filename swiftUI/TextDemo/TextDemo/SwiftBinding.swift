//
//  SwiftBinding.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftBinding: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundStyle(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

#Preview {
    SwiftBinding()
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = .blue
    
    var body: some View {
        Button(action: {
            self.backgroundColor = .orange
            self.buttonColor = .cyan
            self.title = "Hironmoy Dhar"
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
}
