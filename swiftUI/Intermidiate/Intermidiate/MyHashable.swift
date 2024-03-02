//
//  MyHashable.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 02/03/24.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct MyHashable: View {
//    let data: [String] = ["ONE", "TWO", "THREE", "FOUR", "FIVE"]
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text("\(item.title): \(item.hashValue.description)")
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    MyHashable()
}
