//
//  SwiftStateObjectAndObservableObject.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 50)
        let fruit2 = FruitModel(name: "Pineapple", count: 30)
        let fruit3 = FruitModel(name: "Watermelon", count: 08)
        
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            
            self.isLoading = false
        }
        
        
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }

}

struct SwiftStateObjectAndObservableObject: View {
    // @StateObject -> USE THIS ON CREATION / INIT
    // @ObservedObject -> USE THIS FOR SUBVIEW
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                        }
                    }
                    //                .onDelete(perform: { indexSet in
                    //                    deleteFruit(index: indexSet)
                    //                })
                    // or Short form
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .navigationTitle("Fruit List")
            .listStyle(GroupedListStyle())
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    
                        NavigationLink {
                            SecondView(fruitViewModel: FruitViewModel())
                        } label: {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                                .font(.title)
                        }

                }
            }
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
//            Button(action: {
//                presentationMode()
//            }, label: {
//                Text("GO BACK")
//                    .foregroundStyle(.white)
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//            })
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                }
            }
        }
    }
}

#Preview {
    SwiftStateObjectAndObservableObject()
}
