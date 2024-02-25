//
//  ListRowView.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "First title", isCompleted: false))
        
        ListRowView(item: ItemModel(title: "Second title", isCompleted: true))
    }
}
