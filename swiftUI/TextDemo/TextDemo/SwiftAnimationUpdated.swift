//
//  SwiftAnimationUpdated.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftAnimationUpdated: View {
    @State private var animation1: Bool = false
    @State private var animation2: Bool = false
    
    var body: some View {
//        VStack {
//            Button("Action 1") {
//                    animation1.toggle()
//            }
//            
//            Button("Action 2") {
//                
//            }
//            
//            ZStack {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: animation1 ? .trailing : .leading)
//                    .background(.yellow)
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//            .background(.red)
//        }
//        .animation(.spring)
        
        
        VStack {
            Button("Action 1") {
                animation1.toggle()
            }
            
            Button("Action 2") {
                animation2.toggle()
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: animation1 ? .trailing : .leading)
                    .background(.yellow)
                    .frame(maxHeight: .infinity, alignment: animation2 ? .bottom : .top)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.red)
        }
        .animation(.spring(), value: animation1)
        .animation(.linear(duration: 5), value: animation2)
    }
}

#Preview {
    SwiftAnimationUpdated()
}
