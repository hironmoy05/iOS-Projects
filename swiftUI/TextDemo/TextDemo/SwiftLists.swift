//
//  SwiftLists.swift
//  TextDemo
//
//  Created by Gaurav Sara on 11/02/24.
//

import SwiftUI

struct SwiftLists: View {
    @State var fruits: [String] = ["apple", "orange", "banana", "peech"]
    @State var veggies: [String] = ["Tomato", "Potato", "Carrot"]
    
    var body: some View {
//        List {
//            Section {
//                ForEach(fruits, id: \.self) { fruit in
//                    Text(fruit.capitalized)
//                }
//                .onDelete(perform: { indexSet in
//                    delete(indexSet: indexSet)
//                })
//                //or
//                .onDelete(perform: delete)
//                
//            } header: {
//                Text("Fruits")
//            }
//        }
        
        NavigationStack {
            
            List {
//                Section {
//                    ForEach(fruits, id: \.self) { fruit in
//                        Text(fruit.capitalized)
//                    }
//                    .onDelete(perform: delete)
//
//                } header: {
//                    Text("Fruits")
//                }
                
                // for drop down
                DisclosureGroup(content: {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.subheadline)
                            .foregroundStyle(.red)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .background(.purple)
                            .padding(.vertical, 10)
                    }
                    .onDelete(perform: delete)
//                    .onMove(perform: { indices, newOffset in
//                        move(indices: indices, newOffset: newOffset)
//                    })
                    // or
                    .onMove(perform: move)
                }) {
                    HStack {
                        Text("Fruits")
                            .foregroundStyle(.red)
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.red)
                    }
                    .font(.title)
                }
                .listRowBackground(Color.cyan)
                
                Section {
                    DisclosureGroup(
                        content: {
                            ForEach(veggies, id: \.self) { veggie in
                                Text(veggie.capitalized)
                            }
                        },
                        label: {
                            Text("Veggie")
                                .foregroundStyle(.red)
                        }
                    )
                }
            }
            .listRowBackground(Color.red)
//            .listStyle(InsetListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: { EditButton() })
                ToolbarItem(placement: .topBarTrailing, content: { addButton })
            }
            .tint(Color.red)
            
        }
    }
    
    var addButton: some View {
        Button("Add") {
            add()
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

#Preview {
    SwiftLists()
}
