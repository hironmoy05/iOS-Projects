//
//  MyFileManager.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 19/03/24.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    private init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path(percentEncoded: true)   else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
               try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("Success creating folder.")
            } catch let error {
                print("Error creating folder, \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path(percentEncoded: true)   else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
//        image.jpegData(compressionQuality: 1.0)
        guard 
            let data = image.pngData(),
            let path = getPathForImage(name: name) else {
            return "Error getting data"
        }
        
//        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
//        let directory3 = FileManager.default.temporaryDirectory
        
//        let path = directory?.appendingPathComponent("\(name).png")
        
        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
            return "Error saving \(error)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path(percentEncoded: true),
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted."
        } catch let error {
            return "Error deleting image. \(error)"
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).png") else {
            print("Error getting path.")
            return nil
        }
        
        return path
    }
}

class MyFileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "actor"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
}

struct MyFileManager: View {
    @StateObject var vm = MyFileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                HStack {
                    Button(action: {
                        vm.saveImage()
                    }, label: {
                        Text("Save to FM")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete From FM")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
            }
            .navigationTitle("File Manager")
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    MyFileManager()
}
