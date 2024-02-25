//
//  ItemModel.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
