//
//  SwiftState.swift
//  TextDemo
//
//  Created by Gaurav Sara on 07/02/24.
//

import SwiftUI

struct SwiftState: View {
    @State var backgroundColor: Color = .mint
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Title")
                    .font(.title)
                Text("Count \(count)")
                    .font(.headline)
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColor = .cyan
                        count += 1
                    }
                    .padding()
                    .background(.blue)
                    
                    Button("Button 2") {
                        if count > 1 {
                            count -= 1
                        }
                        backgroundColor = .purple
                    }
                    .padding()
                    .background(.green)
                }
                
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    SwiftState()
}
