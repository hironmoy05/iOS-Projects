//
//  AddView.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type some thing here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hex: "#D3D3D3"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
