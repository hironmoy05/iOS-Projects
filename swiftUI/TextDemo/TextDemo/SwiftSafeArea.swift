//
//  SwiftSafeArea.swift
//  TextDemo
//
//  Created by Gaurav Sara on 06/02/24.
//

import SwiftUI

struct SwiftSafeArea: View {
    var body: some View {
//                 1st approach to get into the safe area
//                    Rectangle()
//                        .frame(height: 0)
//                    Text("Hello World")
//                        .frame(maxWidth: .infinity)
//                        .background(.red)
//        
//                    Spacer()
        
        
        
        
        // 2nd approach
        //        ZStack {
        //            // Background
        //            Color.blue
        ////                .ignoresSafeArea()
        //
        //            // Foreground
        //            VStack {
        //                Rectangle()
        //                    .frame(height: 0.2)
        //                    .background(.windowBackground)
        //                Text("Hello World")
        //                    .frame(maxWidth: .infinity)
        //                    .background(.red)
        //                    .padding(.top, -8)
        //
        //                Spacer()
        //            }
        //        }
        

        
        // 3rd approach--> Best Approach
        ScrollView {
            VStack {
                Text("Title goes here!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(.red)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                }
            }
        }
        .background(
            Color.green
                .ignoresSafeArea(edges: .horizontal)
        )
    }
}

#Preview {
    SwiftSafeArea()
}
