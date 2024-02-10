//
//  SwiftNavigationViewAndLink.swift
//  TextDemo
//
//  Created by Gaurav Sara on 08/02/24.
//

import SwiftUI

struct SwiftNavigationViewAndLink: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
               NavigationLink("Hello world", destination: MyOtherScreen())
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Title")
//            .navigationBarTitleDisplayMode(.automatic)
//            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct MyOtherScreen: View {
    @Environment(\.dismiss) var presentationMode
    
    var body: some View {
//        ZStack {
//            Color.green.ignoresSafeArea()
//            
//                .navigationTitle("Second screen")
//            
//            NavigationLink("Click here", destination: Text("Third screen"))
//        }
        
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("Second screen")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            
            VStack {
                Button(action: {
                    presentationMode()
                }, label: {
                    Image(systemName: "arrow.backward")
                })
                
                NavigationLink("Click here", destination: Text("Third screen"))
            }
        }
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                Button(action: {
                    presentationMode()
                }, label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .foregroundStyle(.black)
                })
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                Button(action: {
                    print("Setting")
                }, label: {
                    Image(systemName: "gear")
                        .foregroundStyle(.black)
                })
            }
        }
    }
}

#Preview {
    SwiftNavigationViewAndLink()
}
