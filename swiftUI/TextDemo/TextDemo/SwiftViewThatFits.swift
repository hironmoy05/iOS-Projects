//
//  SwiftViewThatFits.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftViewThatFits: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
//            Text("This is some text that I would like to display to the user!")
//                .lineLimit(1)
//                .minimumScaleFactor(0.3)
            
            ViewThatFits {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display!")
                Text("This is some text that!")
            }
        }
        .font(.headline)
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .padding(50)
    }
}

#Preview {
    SwiftViewThatFits()
}
