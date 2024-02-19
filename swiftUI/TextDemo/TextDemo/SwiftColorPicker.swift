//
//  SwiftColorPicker.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftColorPicker: View {
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ColorPicker("Select a Color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.horizontal)
        }
    }
}

#Preview {
    SwiftColorPicker()
}
