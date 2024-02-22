//
//  SwiftSwipeActions.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

struct SwiftSwipeActions: View {
    @State var fruits: [String] = ["apple", "orange", "banana", "peech"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.uppercased())
                    .swipeActions(
                        edge: .trailing,
                        allowsFullSwipe: true) {
                            Button("Archive") {
                                
                            }
                            .tint(.green)
                            Button("Save") {
                                
                            }
                            .tint(.blue)
                            Button("Junk") {
                                
                            }
                            .tint(.black)
                        }
                
                        .swipeActions(
                            edge: .leading,
                            allowsFullSwipe: false) {
                                Button("Share") {
                                    
                                }
                                .tint(.yellow)
                            }
            }
//            .onDelete(perform: delete)
        }
    }
    
    func delete(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}

#Preview {
    SwiftSwipeActions()
}
