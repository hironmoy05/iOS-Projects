//
//  SwiftDocumentation.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct SwiftOnAppearAndDisappear: View {
    @State var myText: String = "Start text."
    @State var count: Int = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending Text"
            })
            .navigationTitle("On Appear \(count)")
        }
    }
}

#Preview {
    SwiftOnAppearAndDisappear()
}
