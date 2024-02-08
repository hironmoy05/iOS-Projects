//
//  SwiftSheetTransitionOffsetForPopover.swift
//  TextDemo
//
//  Created by Gaurav Sara on 08/02/24.
//

import SwiftUI

struct SwiftSheetTransitionOffsetForPopover: View {
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.cyan
                .ignoresSafeArea()
            
            Button(action: {
//                showView.toggle()
                
                withAnimation(Animation.spring) {
                    showView.toggle()
                }
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .font(.title2)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color.white.cornerRadius(8))
            })
            
            // METHOD 1 - SHEET
//            .sheet(isPresented: $showView, content: {
//                SecondVC()
//            })
            
            // METHOD 2 - TRANSITION
//            ZStack {
//                if showView {
//                    SecondVC(showView: $showView)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                }
//            }
//            .zIndex(2.0)
            
            // METHOD 3 - ANIMATION OFFSET
            SecondVC(showView: $showView)
                .padding(.top, 100)
                .offset(y: showView ? 0 :UIScreen.main.bounds.height)
        }
    }
}

struct SecondVC: View {
    @Environment(\.dismiss) var presentationMode
    @Binding var showView: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.mint
                .ignoresSafeArea()
            
            Button(action: {
//                presentationMode.callAsFunction()
                showView.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .padding()
                    .background(Color.white.cornerRadius(8))
            })
            .padding()
        }
    }
}

#Preview {
    SwiftSheetTransitionOffsetForPopover()
//    SecondVC()
}
