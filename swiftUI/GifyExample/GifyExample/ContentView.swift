//
//  ContentView.swift
//  GifyExample
//
//  Created by Gaurav Sara on 20/03/24.
//

import SwiftUI
import GiphyUISDK

struct ContentView: View {
    @State private var showingDialog = false
    
    var body: some View {
        Button("Show Giphy Dialog") {
            showingDialog.toggle()
        }
        .padding()
        .sheet(isPresented: $showingDialog, content: {
            GiphyPicker()
        })
    }
}

#Preview {
    ContentView()
}
