//
//  SwiftGroup.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftGroup: View {
    var body: some View {
        VStack(spacing: 30) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Group {
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .foregroundStyle(.green)
            .font(.caption)
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    SwiftGroup()
}
