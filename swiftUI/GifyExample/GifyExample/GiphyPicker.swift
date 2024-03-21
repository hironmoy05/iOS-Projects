//
//  GifyPicker.swift
//  GifyExample
//
//  Created by Gaurav Sara on 20/03/24.
//

import SwiftUI
import GiphyUISDK

struct GiphyPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<GiphyPicker>) -> GiphyViewController {
        Giphy.configure(apiKey: "r69EVBO6aV2yOVSGtiQE12kUaaUUtlFz")
        let giphy = GiphyViewController()
        GiphyViewController.trayHeightMultiplier = 0.7
        giphy.swiftUIEnabled = true
        giphy.shouldLocalizeSearch = true
        giphy.dimBackground = true
        giphy.modalPresentationStyle = .currentContext
        
        return giphy
    }
    
    func updateUIViewController(_ uiViewController: GiphyViewController, context: UIViewControllerRepresentableContext<GiphyPicker>) {
        
    }
}
