//
//  MyRotationGesture.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 26/02/24.
//

import SwiftUI

struct MyRotationGesture: View {
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(.blue)
            .clipShape((RoundedRectangle(cornerRadius: 10)))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged{ value in
                        angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring()){
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    MyRotationGesture()
}
