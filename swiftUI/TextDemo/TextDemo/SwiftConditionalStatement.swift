//
//  SwiftConditionalStatement.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftConditionalStatement: View {
    @State var showCircle: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
//            Button("Circle Button") {
//                
//                withAnimation {
//                    self.showCircle.toggle()
//                }
//            }
//            
//            if showCircle {
//                Circle()
//                    .fill(.red)
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                    .cornerRadius(50)
//            } else {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//            }
            
            Button("IS LOADING  \(isLoading.description)") {
                self.isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    SwiftConditionalStatement()
}
