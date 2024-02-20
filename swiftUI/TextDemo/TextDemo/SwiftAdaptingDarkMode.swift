//
//  SwiftAdaptingDarkMode.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct SwiftAdaptingDarkMode: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This text is primary")
                        .foregroundStyle(.primary)
                    Text("This color is Secondary")
                        .foregroundStyle(.secondary)
                    Text("This color is black")
                        .foregroundStyle(.black)
                    Text("This color is white")
                        .foregroundStyle(.white)
                    Text("This color is globally adaptive")
                        .foregroundStyle(Color( "adaptiveColor"))
                    Text("This color is locally adaptive")
                        .foregroundStyle(colorScheme == .light ? .green : .red)
                }
            }
            .navigationTitle("Dark Mode")
        }
    }
}

#Preview {
    SwiftAdaptingDarkMode()
        .preferredColorScheme(.light)
}
