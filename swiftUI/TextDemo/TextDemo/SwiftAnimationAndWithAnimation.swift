//
//  SwiftAnimationAndWithAnimation.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftAnimationAndWithAnimation: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
//                withAnimation(.default.delay(0.5)) {
//                    self.isAnimated.toggle()
//                }
                
                withAnimation(.easeInOut.repeatCount(5, autoreverses: true)) {
                    self.isAnimated.toggle()
                }
                
//                withAnimation(.easeInOut.repeatForever()) {
//                    self.isAnimated.toggle()
//                }
                
//                self.isAnimated.toggle()
            }

            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/ : 300,
                    height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
//                .animation(.easeInOut.repeatCount(5, autoreverses: true), value: isAnimated)
            
            Spacer()
        }
    }
}

#Preview {
    SwiftAnimationAndWithAnimation()
}
