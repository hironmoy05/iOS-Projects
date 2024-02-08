//
//  SwiftSheetAndFullScreenCover.swift
//  TextDemo
//
//  Created by Gaurav Sara on 08/02/24.
//

import SwiftUI

struct SwiftSheetAndFullScreenCover: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            Button(action: {
                showSheet = true
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundStyle(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
//            .sheet(isPresented: $showSheet, content: {
            // DO NOT ADD CONDITIONAL LOGIC
//                SecondScreen()
//            })
            .fullScreenCover(isPresented: $showSheet, content: {
                // DO NOT ADD CONDITIONAL LOGIC
                SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    @Environment(\.dismiss) var presentationModal
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            Button(action: {
                presentationModal.callAsFunction()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
//                    .background(Color.white.cornerRadius(5))
            })
            .padding(.leading)
        }
    }
}

#Preview {
    SwiftSheetAndFullScreenCover()
}
