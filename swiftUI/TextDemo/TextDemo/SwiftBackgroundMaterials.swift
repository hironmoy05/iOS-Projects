//
//  SwiftBackgroundMaterials.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

struct SwiftBackgroundMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .background(.black)
                    .padding()
                
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .ignoresSafeArea()
        .background(
            Image("rock")
                .resizable()
                .scaledToFill()
        )
    }
}

#Preview {
    SwiftBackgroundMaterials()
}
