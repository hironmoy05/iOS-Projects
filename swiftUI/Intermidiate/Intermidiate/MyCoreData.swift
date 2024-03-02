//
//  MyCoreData.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 03/03/24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error {
                print("ERROR LOADING CORE DATA. \(error.localizedDescription)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        
        saveData()
    }
    
    func deleteFruit(index: IndexSet) {
        guard let index = index.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving: \(error.localizedDescription)")
        }
    }
}

struct MyCoreData: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Rectangle()
                    .frame(height: 0)
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                Button {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }

                
                List {
                    ForEach(vm.savedEntities) { fruit in
                        if let name = fruit.name {
                            Text(name)
                                .onTapGesture {
                                    vm.updateFruit(entity: fruit)
                                }
                        }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    MyCoreData()
}
