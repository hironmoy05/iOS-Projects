//
//  ContentView.swift
//  objective_c_swiftui
//
//  Created by Gaurav Sara on 11/01/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isLabelVisible = false
    @State private var audioPlayer: AVAudioPlayer?
    
    let imageName = "cat"
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Meow!!!")
                    .font(Font.system(size: 60))
                    .foregroundStyle(.white)
                    .shadow(color: .black, radius: 4, x: 5, y: 5)
                    .opacity(isLabelVisible ? 1 : 0)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity )
                    .frame(maxHeight: .infinity)
                
                Spacer()
                
                Button(action: {
                    playSound()
                    isLabelVisible = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isLabelVisible = false
                    }
                    
                }) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .buttonStyle(.plain)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        }
        .onAppear{
            loadSound()
        }
    }
    
    private func loadSound() {
       guard let soundURL = Bundle.main.url(forResource: "Cat", withExtension: "wav") else {
           print("Sound file not found.")
           return
       }

       do {
           audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
           audioPlayer?.prepareToPlay()
       } catch {
           print("Error loading sound: \(error)")
       }
   }
    
    private func playSound() {
       audioPlayer?.play()
   }
}

#Preview {
    ContentView()
}
