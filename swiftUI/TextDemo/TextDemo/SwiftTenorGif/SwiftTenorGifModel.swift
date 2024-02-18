//
//  SwiftTenorGifModel.swift
//  TextDemo
//
//  Created by Gaurav Sara on 16/02/24.
//

import Foundation

struct GIFData: Codable {
    let contentDescription: String
    let hasAudio: Int
    let itemURL: String
    let imageURL: String
    let media_formats: [String: MediaFormat]
    let id: Int
    let tags: [String]
    let flags: [String]
    let created: TimeInterval
    let title: String?
    
    init(fromDictionary dictionary: [String: Any]?) {
        guard let dictionary = dictionary,
              let contentDescription = dictionary["content_description"] as? String,
              let hasAudio = dictionary["hasaudio"] as? Int,
              let itemURL = dictionary["itemurl"] as? String,
              let imageURL = dictionary["url"] as? String,
              let id = dictionary["id"] as? Int,
              let tags = dictionary["tags"] as? [String],
              let flags = dictionary["flags"] as? [String],
              let created = dictionary["created"] as? TimeInterval
        else {
            fatalError("Invalid dictionary format")
        }
        
        self.contentDescription = contentDescription
        self.hasAudio = hasAudio
        self.itemURL = itemURL
        self.imageURL = imageURL
        self.id = id
        self.tags = tags
        self.flags = flags
        self.created = created
        self.title = dictionary["title"] as? String
        
        if let formatsDict = dictionary["media_formats"] as? [String: [String: Any]] {
            var formats = [String: MediaFormat]()
            for (key, value) in formatsDict {
                formats[key] = MediaFormat(fromDictionary: value)
            }
            media_formats = formats
        } else {
            media_formats = [:]
        }
    }

}

struct MediaFormat: Codable {
    let dims: [Int]
    let duration: Double
    let preview: String
    let size: Int
    let url: String
    
    init(fromDictionary dictionary: [String: Any]?) {
        guard let dictionary = dictionary,
              let dims = dictionary["dims"] as? [Int],
              let duration = dictionary["duration"] as? Double,
              let preview = dictionary["preview"] as? String,
              let size = dictionary["size"] as? Int,
              let url = dictionary["url"] as? String
        else {
            fatalError("Invalid dictionary format for MediaFormat")
        }
        
        self.dims = dims
        self.duration = duration
        self.preview = preview
        self.size = size
        self.url = url
    }
}


class GIFViewModel: ObservableObject {
    @Published var gif: [GIFData]?
    let apiKey = "AIzaSyAfLjpwbnhdjzdGhEmny05vTrHsKA4EPWo"
    
    func fetchFeaturedGIF() {
       
        guard let url = URL(string: "https://tenor.googleapis.com/v2/featured?key=\(apiKey)&client_key=my_test_app") else { return }
//
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching GIF: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
//                let decodedResponse = try JSONDecoder().decode([GIF].self, from: data)
//                DispatchQueue.main.async {
//                    self.gif = decodedResponse.first
//                }
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? GIFData {
                    self.gif?.append(jsonResult)
                    print(jsonResult)
                }
            } catch {
                print("Error decoding GIF response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func fetchGIF() {
        
        guard let url = URL(string: "https://tenor.googleapis.com/v2/search?q=excited&key=\(apiKey)&client_key=my_test_app&limit=8") else { return }
//
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching GIF: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                if jsonResult != nil {
                    let results = jsonResult?["results"] as? [[String: Any]]
                        
                    for item in results! {
                        print(item)
                        let gifData = GIFData(fromDictionary: item)
                        self.gif?.append(gifData)
                    }
                    
                    print(self.gif!)
                }
                    
                
            } catch {
                print("Error decoding GIF response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
