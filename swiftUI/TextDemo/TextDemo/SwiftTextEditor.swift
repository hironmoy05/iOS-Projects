//
//  SwiftTextEditor.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftTextEditor: View {
    @State var textEditorText: String = "Start Typing..."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationStack {
            Rectangle()
                .frame(height: 0.0)
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundStyle(.indigo)
                    .colorMultiply(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10)
                    )
                Button(action: {
                    savedText = textEditorText
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                Text(savedText)
                Spacer()
            }
            .padding()
            .background(.green)
            .navigationTitle("Text Editor")
        }
        
        Rectangle()
            .frame(height: 0.0)
    }
}

#Preview {
    SwiftTextEditor()
}
