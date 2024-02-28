//
//  MyScrollViewReader.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 28/02/24.
//

import SwiftUI

struct MyScrollViewReader: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now") {
//                proxy.scrollTo(49, anchor: .center)
                withAnimation(.spring) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader(content: { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                            .id(index)
                    }
                    // Depricated
//                    .onChange(of: scrollToIndex, perform: { value in
//                        withAnimation(.spring) {
//                            proxy.scrollTo(value, anchor: nil)
//                        }
//                    })
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                })
                
            }
        }
    }
}

#Preview {
    MyScrollViewReader()
}
