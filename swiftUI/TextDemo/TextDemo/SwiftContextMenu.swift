//
//  SwiftContextMenu.swift
//  TextDemo
//
//  Created by Gaurav Sara on 15/02/24.
//

import SwiftUI

struct SwiftContextMenu: View {
    @State var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
        }
        .padding(30)
        .background(backgroundColor)
        .foregroundStyle(.white)
        .cornerRadius(10)
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                backgroundColor = .green
            }, label: {
                Label("Share Post", systemImage: "flame.fill")
            })
            
            
            Button(action: {
                
            }, label: {
                Text("Report Post")
            })
            
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Like Post")
                    Image(systemName: "heart.fill")
                }
            })
        }))
        
        VStack {
            HStack {
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    Text("@username")
                }
                Spacer()
                Image(systemName: "ellipsis")
                .tint(.primary)
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {
                        backgroundColor = .green
                    }, label: {
                        Label("Share Post", systemImage: "flame.fill")
                    })
                    
                    Button(action: {
                        backgroundColor = .red
                    }, label: {
                        Text("Report Post")
                    })
                    
                    Button(action: {
                        backgroundColor = .cyan
                    }, label: {
                        HStack {
                            Text("Like Post")
                            Image(systemName: "heart.fill")
                        }
                    })
                }))
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    SwiftContextMenu()
}
