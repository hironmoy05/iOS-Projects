//
//  SwiftPageTabViewStyle.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct SwiftTabViewPageTabViewStyle: View {
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
//        TabView(selection: $selectedTab) {
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//
//            Text("BROWSE TAB")
//                .tabItem {
//                    Image(systemName: "globe")
//                    Text("Browse")
//                }
//                .tag(1)
//            
//            Text("Profile TAB")
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//                .tag(2)
//        }
//        .tint(.green)
        
        
//        TabView {
////            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
////            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
////            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//            
//            ForEach(icons, id: \.self) { icon in
//                Image(systemName: "\(icon)")
//                    .resizable()
//                    .scaledToFit()
//                }
//        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400)
//        .background(
//            RadialGradient(colors: [Color.red, Color.blue], center: .center, startRadius: 5, endRadius: 300)
//        )
//        .padding(.horizontal)
//        .tabViewStyle(PageTabViewStyle())
        
        TabView(selection: $selectedTab) {
            ForEach(icons.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.green)
                    .overlay(
                        Image(systemName: icons[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    )
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    SwiftTabViewPageTabViewStyle()
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
            }
        }
    }
}
