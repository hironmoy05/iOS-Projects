//
//  SwiftToggle.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftToggle: View {
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $toggleIsOn) {
                Text("Change Status")
            }
            .toggleStyle(SwitchToggleStyle())
            .tint(.purple)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SwiftToggle()
}
