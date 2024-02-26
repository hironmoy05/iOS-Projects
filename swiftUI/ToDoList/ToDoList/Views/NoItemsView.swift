//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let primaryAccentColor = Color("AccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo lists!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? secondaryAccentColor : primaryAccentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, animate ? 30 : 60)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : primaryAccentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    NoItemsView()
}
