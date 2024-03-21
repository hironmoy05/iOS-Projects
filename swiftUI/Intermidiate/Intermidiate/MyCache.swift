//
//  MyCache.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 21/03/24.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache!"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class MyCacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "actor"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Get image from cache"
        } else {
            infoMessage = "Image not found in cache"
        }
    }
}

struct MyCache: View {
    
    @StateObject var vm = MyCacheViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                HStack {
                    Button {
                        vm.saveToCache()
                    } label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        vm.removeFromCache()
                    } label: {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                Button {
                    vm.getFromCache()
                } label: {
                    Text("Get from cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Text(vm.infoMessage)
                
                Spacer()
            }
            .navigationTitle("Cache")
            
        }
    }
}

#Preview {
    MyCache()
}
