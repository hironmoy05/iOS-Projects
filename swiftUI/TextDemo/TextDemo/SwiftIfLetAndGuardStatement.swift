//
//  SwiftIfLetAndGuardStatement.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct SwiftIfLetAndGuardStatement: View {
    @State var currentUserID: Int? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Here we're practicing safe coding")
                if let displayText {
                    Text(displayText)
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! UserID is \(userID)"
                isLoading = false
            }
        } else {
            displayText = "Error There is no user ID"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserID else {
            displayText = "Error There is no user ID"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! UserID is \(userID)"
            isLoading = false
        }
    }
}

#Preview {
    SwiftIfLetAndGuardStatement()
}
