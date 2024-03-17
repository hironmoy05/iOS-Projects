//
//  ContentView.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker.toggle()
            }
            
            Button("Image Save") {
                guard let inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            MyWrappingUIViewInSwiftUIWithCoordinator(image: $inputImage)
        }
        .onChange(of: inputImage) { _, _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage else { return }
        image = Image(uiImage: inputImage)
        
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil) // Instead of this we better do this with class 'ImageSaveer' class. This we're using above in button action where we called this class
    }
}

#Preview {
    ContentView()
}
