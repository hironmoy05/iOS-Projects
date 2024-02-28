//
//  MultipleSheets.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 28/02/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

/*
    1 - use a binding
    2 - use multiple .sheets
    3 - use $item
*/

struct MultipleSheets: View {
//    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
//        VStack {
//            Button("Button 1") {
////                selectedModel = RandomModel(title: "ONE")
//                showSheet.toggle()
//            }
//            .sheet(isPresented: $showSheet, content: {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            })
//            
//            Button("Button 2") {
////                selectedModel = RandomModel(title: "TWO")
//                showSheet2.toggle()
//            }
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            })
//        }
////        .sheet(isPresented: $showSheet, content: {
////            NextScreen(selectedModel: selectedModel)
////        })
//    }
        ScrollView {
            VStack {
                //            Button("Button 1") {
                //                selectedModel = RandomModel(title: "ONE")
                //            }
                //            
                //            Button("Button 2") {
                //                selectedModel = RandomModel(title: "TWO")
                //            }
                
                // OR
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheets()
}
