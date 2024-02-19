//
//  SwiftStepper.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftStepper: View {
    @State var stepperValue: Int = 10
    @State var widthIncrement: Int = 0
    
    var body: some View {
        Text("\(stepperValue)")
            .font(.largeTitle)
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/ + CGFloat(widthIncrement), height: 100)
            
            Stepper("Stepper2") {
                // Increment
                incrementWidth(amount: 100)
            } onDecrement: {
                // Decrement
                incrementWidth(amount: -100)
            }

        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.bouncy) {
            widthIncrement += Int(amount)
        }
    }
}

#Preview {
    SwiftStepper()
}
