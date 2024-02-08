//
//  SwiftTransition.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftTransition: View {
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.teal
            VStack {
                Button("Button") {
//                    showView.toggle()
                    
                    withAnimation(.easeInOut) {
                        showView.toggle()
                    }
                }
                
                Spacer()
            }
            
//            RoundedRectangle(cornerRadius: 30)
//                .frame(height: UIScreen.main.bounds.height / 2)
//                .opacity(showView ? 1.0 : 0.0)
//                .animation(.easeInOut, value: showView)
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
//                    .transition(.opacity
//                    .transition(AnyTransition.opacity.animation(.easeInOut))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
//                    .transition(.asymmetric(
//                        insertion: .move(edge: .leading),
//                        removal: .move(edge: .trailing)))
                
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: AnyTransition.opacity.animation(.easeInOut)))
                    }
            
            Button("Button") {
                showView.toggle()
            }
            
            Spacer()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SwiftTransition()
}
