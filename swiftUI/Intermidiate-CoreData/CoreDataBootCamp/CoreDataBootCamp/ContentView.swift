//
//  ContentView.swift
//  CoreDataBootCamp
//
//  Created by Gaurav Sara on 02/03/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: FruitEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)]) var fruits: FetchedResults<FruitEntity>
    
    @State var textFieldText: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Rectangle()
                    .frame(height: 0)
                    .frame(maxWidth: .infinity)
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
                
                Button(action: {
                    addItem()
                }, label: {
                    Text("Submit".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 20)
                })
                
                List {
                    ForEach(fruits) { fruit in
                        if let name = fruit.name {
                            Text(name)
                                .onTapGesture {
                                    updateItem(fruit: fruit)
                                }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                        Button(action: addItem) {
//                            Label("Add Item", systemImage: "plus")
//                        }
//                    }
//            }
            
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = textFieldText
            textFieldText = ""

            saveItems()
        }
    }

    private func updateItem(fruit: FruitEntity) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + "!"
            fruit.name = newName
            
            saveItems()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            offsets.map { fruits[$0] }.forEach(viewContext.delete)
            // more simple way
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)

            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
