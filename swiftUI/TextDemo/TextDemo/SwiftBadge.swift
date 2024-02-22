//
//  SwiftBadge.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

// List
// TabView

struct SwiftBadge: View {
    var body: some View {
//        TabView {
//            Color.blue
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Heart")
//                }
//                .badge(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//            
//            Color.green                
//                .tabItem {
//                Image(systemName: "heart.fill")
//                Text("Heart")
//            }
//                .badge("New")
//
//            
//            Color.red
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Heart")
//                }
//                .badge(0)
//
//        }
        
        List {
            Text("one")
                .badge("First")
            Text("Two")
            Text("Three")
            Text("Four")
        }
    }
}

#Preview {
    SwiftBadge()
}
