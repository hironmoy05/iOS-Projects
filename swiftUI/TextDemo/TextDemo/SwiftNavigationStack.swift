//
//  SwiftNavigationStack.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

struct SwiftNavigationStack: View {
    
    let fruits = ["Apple", "Banana", "Orange"]
    
    @State private var stackPath: [String] = []
    
    var body: some View {
//        NavigationView {
//            VStack(spacing: 40) {
//                ForEach(1...10, id: \.self) { i in
//                    NavigationLink {
//                        SecondScreenView(value: i)
//                    } label: {
//                        Text("Click me \(i)")
//                    }            }
//            }
//            .navigationTitle("Swift Nav")
//        }
        
        // Lazy loading screens
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 40) {
//                    
//                    ForEach(fruits, id: \.self) { fruit in
//                        NavigationLink(value: fruit) {
//                            Text("Click me \(fruit)")
//                        }
//                    }
//                    
//                    ForEach(1...10, id: \.self) { i in
//                        NavigationLink(value: i) {
//                            Text("Click me \(i)")
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Swift Nav")
//            .navigationDestination(for: Int.self) { value in
//                SecondScreenView(value: value)
//            }
//            .navigationDestination(for: String.self) { value in
//                SecondScreenView2(value: value)
//            }
//        }
        
        
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 40) {
                    
                    Button("Super seque!") {
                        stackPath.append(contentsOf: ["Coconu", "Watermelon", "Guava"])
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text("Click me \(fruit)")
                        }
                    }
                    
                    ForEach(1...10, id: \.self) { i in
                        NavigationLink(value: i) {
                            Text("Click me \(i)")
                        }
                    }
                }
            }
            .navigationTitle("Swift Nav")
            .navigationDestination(for: Int.self) { value in
                SecondScreenView(value: value)
            }
            .navigationDestination(for: String.self) { value in
                SecondScreenView2(value: value)
            }
        }
    }
}

struct SecondScreenView: View {
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("Init Screen \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

struct SecondScreenView2: View {
    let value: String
    
    init(value: String) {
        self.value = value
        print("Init Screen \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    SwiftNavigationStack()
}
