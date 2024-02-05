//
//  SwiftInitializers.swift
//  TextDemo
//
//  Created by Gaurav Sara on 05/02/24.
//

import SwiftUI

struct SwiftInitializers: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
//    init(count: Int, title: String) {
//        self.count = count
//        self.title = title
//        
//        if title == "Apples" {
//            self.backgroundColor = .red
//        } else if title == "Oranges" {
//            self.backgroundColor = .orange
//        } else {
//            self.backgroundColor = .green
//        }
//    }
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else if fruit == .orange {
            self.title = "Oranges"
            self.backgroundColor = .orange
        } else {
            self.title = "Guava"
            self.backgroundColor = .green
        }
    }
    
    enum Fruit {
        case apple
        case orange
        case guava
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(20)
        
    }
}

#Preview {
    VStack {
        SwiftInitializers(count: 1, fruit: .apple)
        SwiftInitializers(count: 2, fruit: .orange)
        SwiftInitializers(count: 3, fruit: .guava)
    }
}
