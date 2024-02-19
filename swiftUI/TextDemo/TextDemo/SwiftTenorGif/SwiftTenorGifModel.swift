//
//  SwiftTenorGifModel.swift
//  TextDemo
//
//  Created by Gaurav Sara on 16/02/24.
//

import Foundation

struct GIFData {
    let contentDescription: String
    let hasAudio: Int
    let itemURL: String
    let imageURL: String
    let mediaFormats: [String: MediaFormat]
    let id: Int
    let tags: [String]
    let flags: [String]
    let created: TimeInterval
    let title: String?
    
    init(fromDictionary dictionary: [String: Any]?) {
        guard let dictionary = dictionary else {
            fatalError("Invalid dictionary")
        }
        contentDescription = dictionary["contentDescription"] as? String ?? ""
        hasAudio = dictionary["hasAudio"] as? Int ?? 0
        itemURL = dictionary["itemURL"] as? String ?? ""
        imageURL = dictionary["imageURL"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        tags = dictionary["tags"] as? [String] ?? []
        flags = dictionary["flags"] as? [String] ?? []
        created = dictionary["created"] as? TimeInterval ?? 0
        title = dictionary["title"] as? String
        if let mediaDict = dictionary["media_formats"] as? [String: [String: Any]] {
            var formats = [String: MediaFormat]()
            for (key, value) in mediaDict {
                formats[key] = MediaFormat(fromDictionary: value)
            }
            mediaFormats = formats
        } else {
            mediaFormats = [:]
        }
    }
    
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary["contentDescription"] = contentDescription
        dictionary["hasAudio"] = hasAudio
        dictionary["itemURL"] = itemURL
        dictionary["imageURL"] = imageURL
        dictionary["id"] = id
        dictionary["tags"] = tags
        dictionary["flags"] = flags
        dictionary["created"] = created
        dictionary["title"] = title
        var mediaDict = [String: [String: Any]]()
        for (key, value) in mediaFormats {
            mediaDict[key] = value.toDictionary()
        }
        dictionary["media_formats"] = mediaDict
        return dictionary
    }
}

struct MediaFormat {
    let dims: [Int]
    let duration: Double
    let preview: String
    let size: Int
    let url: String
    
    init(fromDictionary dictionary: [String: Any]?) {
        guard let dictionary = dictionary else {
            fatalError("Invalid dictionary")
        }
        dims = dictionary["dims"] as? [Int] ?? []
        duration = dictionary["duration"] as? Double ?? 0
        preview = dictionary["preview"] as? String ?? ""
        size = dictionary["size"] as? Int ?? 0
        url = dictionary["url"] as? String ?? ""
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "dims": dims,
            "duration": duration,
            "preview": preview,
            "size": size,
            "url": url
        ]
    }
}


class GIFViewModel: ObservableObject {
    var gif: [GIFData] = []
    let apiKey = "AIzaSyAfLjpwbnhdjzdGhEmny05vTrHsKA4EPWo"
    
    func fetchFeaturedGIF() {
       
        guard let url = URL(string: "https://tenor.googleapis.com/v2/featured?key=\(apiKey)&client_key=my_test_app") else { return }
        
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
                    self.gif.append(jsonResult)
                    print(jsonResult)
                }
            } catch {
                print("Error decoding GIF response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func fetchGIF() {
        
        guard let url = URL(string: "https://tenor.googleapis.com/v2/search?q=excited&key=\(apiKey)&client_key=my_test_app&limit=8") else { return }

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
                        let gifData = GIFData(fromDictionary: item)
                        DispatchQueue.main.async {
                            self.gif.append(gifData)
                        }
                    }
                }
            } catch {
                print("Error decoding GIF response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
