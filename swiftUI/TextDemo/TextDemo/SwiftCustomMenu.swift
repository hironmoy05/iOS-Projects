//
//  SwiftCustomMenu.swift
//  TextDemo
//
//  Created by Gaurav Sara on 29/02/24.
//

import SwiftUI

struct SwiftCustomMenu: View {
  @State var isMenuOpen: Bool = false

  var body: some View {
    ZStack {
      CustomMenu(isMenuOpen: $isMenuOpen)
      Button("click me") {
        withAnimation(.bouncy(duration: 0.5)) {
          isMenuOpen.toggle()
        }
      }
    }
  }
}

struct CustomMenu: View {
  @Binding var isMenuOpen: Bool

  var body: some View {
    if isMenuOpen {
      GeometryReader { geometry in
        let buttonFrame = geometry.frame(in: .local) // Get global frame of containing ZStack
        Rectangle()
          .frame(width: 200, height: 200)
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .shadow(color: .black.opacity(0.2), radius: 50, x: 0, y: 0)
          .transition(.asymmetric(
              insertion: AnyTransition.opacity.animation(.bouncy),
              removal: AnyTransition.opacity.animation(.easeInOut)))
          .offset(x: buttonFrame.width - 100, y: buttonFrame.height - 200) // Position above the button
      }
    }
  }
}



#Preview {
    SwiftCustomMenu()
}
