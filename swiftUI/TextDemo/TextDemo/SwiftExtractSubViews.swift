//
//  SwiftExtractSubViews.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftExtractSubViews: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack(spacing: 20) {
            MyItem(count: 1, title: "Apples", backgroundColor: .cyan)
            MyItem(count: 2, title: "Banana", backgroundColor: .red)
            MyItem(count: 3, title: "Pineapple", backgroundColor: .purple)
        }
    }
}

#Preview {
    SwiftExtractSubViews()
}

struct MyItem: View {
    let count: Int
    let title: String
    let backgroundColor: Color
    
    init(count: Int, title: String, backgroundColor: Color) {
        self.count = count
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .frame(width: 80, height: 80)
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
    }
}
