//
//  SwiftResizableSheet.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftResizableSheet: View {
    @State private var showSheet: Bool = false
    @State private var detent: PresentationDetent = .large
    
    var body: some View {
        Button("Click me") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextView(detent: $detent)
//                .presentationDetents([.medium, .large])
//                .presentationDetents([.fraction(0.9)])
//                .presentationDetents([.height(25)])
//                .presentationDetents([.fraction(0.1), .height(200), .medium, .large])
//                .presentationDetents([.fraction(0.5), .medium, .large, ], selection: $detent)
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
        }
    }
}

struct MyNextView: View {
    @Binding var detent: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("20%") {
                    detent = .fraction(0.2)
                }
                
                Button("MEDIUM") {
                    detent = .medium
                }
                
                Button("Height") {
                    detent = .height(600)
                }
                
                Button("LARGE") {
                    detent = .large
                }
            }
            .foregroundStyle(.white)
        }
        .presentationDetents([.fraction(0.2), .medium, .height(600), .large], selection: $detent)
        .presentationDragIndicator(.hidden)
    }
}

#Preview {
    SwiftResizableSheet()
}
