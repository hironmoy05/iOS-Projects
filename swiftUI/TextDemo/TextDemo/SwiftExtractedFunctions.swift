//
//  SwiftExtractedFunctions.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftExtractedFunctions: View {
    
    @State var backgroundColor: Color = .cyan
    @State var isPressed: Bool = false
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            
            Button(action: {
                buttonPressed()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            })
        }
    }
    
    fileprivate func buttonPressed() {
        self.isPressed.toggle()
        if isPressed {
            self.backgroundColor = .indigo
        } else {
            self.backgroundColor = .cyan
        }
    }
}

#Preview {
    SwiftExtractedFunctions()
}
