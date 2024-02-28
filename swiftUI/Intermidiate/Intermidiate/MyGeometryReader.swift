//
//  MyGeometryReader.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 28/02/24.
//

import SwiftUI

struct MyGeometryReader: View {
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2 // Get the center of the screen
        let currentX = geo.frame(in: .global).midX // Get the center of the ractangle
        
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        ScrollView(.horizontal, content: {
            HStack {
                ForEach(0..<50) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 30),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle().fill(.red)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle().fill(.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    MyGeometryReader()
}
