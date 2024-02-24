//
//  SwiftToolbar.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftToolbar: View {
    @State private var text: String = ""
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack (path: $path) {
            ZStack {
//                Color.indigo
//                    .ignoresSafeArea()
//                
//                Text("Hey 😎")
//                    .foregroundStyle(.white)
                
                ScrollView {
                    TextField("PLaceholder", text: $text)
                    
                    ForEach(0..<50) { _ in
                        Rectangle()
                            .fill(.black)
                            .frame(width: 200, height: 20)
                    }
                }
            }
            .navigationTitle("Toolbar")
            // NavigationBarItem is depricated
//            .navigationBarItems(
//                leading: Image(systemName: "heart.fill"),
//                trailing: Image(systemName: "gear")
//            )
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
//                    Image(systemName: "gear")
//                        .background(.red)
//                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    HStack {
//                        Image(systemName: "house.fill")
                        Image(systemName: "gear")
                    }
                }
            }
//            .navigationBarHidden(true) // Depricated
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Screen 1") {
                    path.append("screen 1")
                }
                
                Button("Screen 2") {
                    path.append("screen 2")
                }
            }
            .navigationDestination(for: String.self) { value in
                Text("New String \(value)")
            }
        }
    }
}

#Preview {
    SwiftToolbar()
}
