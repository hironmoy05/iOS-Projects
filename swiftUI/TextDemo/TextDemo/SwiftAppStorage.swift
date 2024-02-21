//
//  SwiftAppStorage.swift
//  TextDemo
//
//  Created by Gaurav Sara on 21/02/24.
//

import SwiftUI

struct SwiftAppStorage: View {
//    @State var currentUserName: String?
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack {
            Text(currentUserName ?? "Add name here")
            
            if let currentUserName {
                Text(currentUserName)
            }
            Button("Save".uppercased()) {
                let name = "Gaurav"
                 currentUserName = name
//                UserDefaults.standard.setValue(name, forKey: "name")
            }
        }
        .onAppear {
            currentUserName = UserDefaults.standard.string(forKey: "name")
        }
    }
}

#Preview {
    SwiftAppStorage()
}
