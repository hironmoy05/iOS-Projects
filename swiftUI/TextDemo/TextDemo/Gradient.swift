//
//  Gradient.swift
//  TextDemo
//
//  Created by Gaurav Sara on 03/02/24.
//

import SwiftUI
import UIKit

struct Gradient: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color.red
//                LinearGradient(
//                    colors: [Color.red, Color.blue, Color.green, Color.yellow, Color.purple, Color.orange, Color.gray, Color.white, Color.custom],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing)
//                RadialGradient(
//                    colors: [Color("customColor"), Color.blue],
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 400)
                AngularGradient(
                    colors: [Color.red, Color.blue],
                    center: .topLeading,
                    angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    Gradient()
}
