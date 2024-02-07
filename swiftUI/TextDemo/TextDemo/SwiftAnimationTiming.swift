//
//  SwiftAnimationTiming.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftAnimationTiming: View {
    @State var isAnimating: Bool = false
    @State var timing: Double = 0.4
    
    var body: some View {
        Button("Button") {
            isAnimating.toggle()
        }
        
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: isAnimating ? 350 : 50, height: 100)
//            .animation(.linear(duration: timing).repeatForever(), value: isAnimating)
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: isAnimating ? 350 : 50, height: 100)
//            .animation(.easeIn(duration: timing).repeatForever(), value: isAnimating)
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: isAnimating ? 350 : 50, height: 100)
//            .animation(.easeInOut(duration: timing).repeatForever(), value: isAnimating)
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: isAnimating ? 350 : 50, height: 100)
//            .animation(.easeOut(duration: timing).repeatForever(), value: isAnimating)
        
        
//        RoundedRectangle(cornerRadius: 20)
//           .frame(width: isAnimating ? 300 : 50, height: 100)
//           .animation(.spring(
//                duration: 0.5,
//                bounce: 0.7,
//                blendDuration: 1.0
//                ), value: isAnimating)
        
        
        RoundedRectangle(cornerRadius: 20)
           .frame(width: isAnimating ? 300 : 50, height: 100)
           .animation(Animation.spring(
            response: 0.5,
            dampingFraction: 0.7,
            blendDuration: 1.0
           ).repeatForever(), value: isAnimating)
    }
}

#Preview {
    SwiftAnimationTiming()
}
