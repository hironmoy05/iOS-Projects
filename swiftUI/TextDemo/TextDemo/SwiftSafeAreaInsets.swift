//
//  SwiftSafeAreaInsets.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftSafeAreaInsets: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    Rectangle()
                        .frame(height: 300)
                }
            }
            .navigationTitle("Safe Area Insets")
            .navigationBarTitleDisplayMode(.inline)
//            .overlay(
//                Text("hi")
//                    .frame(maxWidth: .infinity)
//                    .background(.yellow)
//                , alignment: .bottom
//            )
            
//            .safeAreaInset(edge: .bottom, alignment: .center, spacing: nil) {
//                Text("hi")
//                    .frame(maxWidth: .infinity)
//                    .background(.yellow)
//            }
            
//            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
//                Text("hi")
//                    .padding(25)
//                    .background(.yellow)
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                    .padding()
//            }
            
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("hi")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.edgesIgnoringSafeArea(.bottom))
            }
        }
    }
}

#Preview {
    SwiftSafeAreaInsets()
}
