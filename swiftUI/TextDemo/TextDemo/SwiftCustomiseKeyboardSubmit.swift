//
//  SwiftCustomiseKeyboardSubmit.swift
//  TextDemo
//
//  Created by Gaurav Sara on 22/02/24.
//

import SwiftUI

struct SwiftCustomiseKeyboardSubmit: View {
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.continue)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.done)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.go)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.join)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.next)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.return)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.search)
            .onSubmit {
                print("print")
            }
        
        TextField("Placeholder", text: $text)
            .submitLabel(.send)
            .onSubmit {
                print("print")
            }
    }
}

#Preview {
    SwiftCustomiseKeyboardSubmit()
}
