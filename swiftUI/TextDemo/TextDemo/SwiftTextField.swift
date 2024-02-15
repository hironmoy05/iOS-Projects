 //
//  SwiftTextField.swift
//  TextDemo
//
//  Created by Gaurav Sara on 15/02/24.
//

import SwiftUI

struct SwiftTextField: View {
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .foregroundStyle(.red)
                    .font(.headline)
                //            .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8.0)
                    )
                
                Spacer()
                    .frame(height: 15)
                
                Button(action: {
                    saveText()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .foregroundStyle(.white)
                        .font(.title3)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(
                            textIsAppropriate() ? Color.blue : Color.gray
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                })
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { item in
                    Text(item)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("SwiftUI")
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

#Preview {
    SwiftTextField()
}
