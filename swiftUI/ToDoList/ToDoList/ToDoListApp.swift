//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - Data Point
 View - UI
 ViewModel - Manages models for view
    
*/

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
