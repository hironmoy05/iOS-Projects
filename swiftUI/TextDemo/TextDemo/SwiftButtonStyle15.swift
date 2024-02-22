//
//  SwiftButtonStyle15.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

struct SwiftButtonStyle15: View {
    var body: some View {
        VStack {
            
            Button(action: {
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            })
            .padding()
            .buttonStyle(.borderedProminent)
//            .buttonBorderShape(.capsule)
//            .buttonBorderShape(.circle)
//            .buttonBorderShape(.roundedRectangle)
//            .buttonBorderShape(.roundedRectangle(radius: 20))
//            .buttonBorderShape(.buttonBorder)
            .buttonBorderShape(.automatic)
            .controlSize(.large)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .controlSize(.extraLarge)
//            .controlSize(.large)
//            .controlSize(.mini)
//            .controlSize(.small)
            .controlSize(.regular) // default
            .buttonStyle(.bordered)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.automatic)
            
        }
    }
}

#Preview {
    SwiftButtonStyle15()
}
