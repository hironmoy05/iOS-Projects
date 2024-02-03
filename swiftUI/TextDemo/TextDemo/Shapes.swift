//
//  Shapes.swift
//  TextDemo
//
//  Created by Gaurav Sara on 03/02/24.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .continuous)
//        Rectangle()
        RoundedRectangle(cornerRadius: 25.0)
//            .fill(Color.green)
//            .foregroundStyle(Color.gray)
//            .stroke()
//            .stroke(Color.red)
//            .stroke(Color.blue, lineWidth: 20.0)
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 30, lineCap: .square, dash: [50]))
//            .trim(from: 0.1, to: 1.0)
//            .stroke(Color.teal, lineWidth: 20)
            .frame(width: 100, height: 200, alignment: .topLeading)
    }
}

#Preview {
    Shapes()
}
