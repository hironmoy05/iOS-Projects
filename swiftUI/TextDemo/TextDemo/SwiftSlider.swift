//
//  SwiftSlider.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftSlider: View {
    @State var sliderValue: Double = 10.0
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Rating")
                .font(.title)
//            Text("\(sliderValue)")
//                .font(.title)
            Text(String(format: "%.1f", sliderValue))
                .foregroundStyle(color)
            
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 0...100)
//            Slider(value: $sliderValue,in: 1...5, step: 0.5)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: {_ in
                    color = .green
                },
                minimumValueLabel: 
                    Text("1")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                ,
                maximumValueLabel: Text("5"),
                label: {
                    Text("Title")
                }
                
            )
                .tint(.red)
        }
        
    }
}

#Preview {
    SwiftSlider()
}
