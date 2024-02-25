//
//  ListRowView.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This is the first item")
}
