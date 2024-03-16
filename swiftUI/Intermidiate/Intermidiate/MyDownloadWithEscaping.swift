//
//  MyDownloadWithEscaping.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 16/03/24.
//

import SwiftUI

struct PostModel:Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class MyDownloadWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromData: url) { data in
            if let data {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("Error downloading data.")
                return
            }
        }
        
        /*
        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print("No data.")
//                return
//            }
//            
//            guard error == nil else {
//                print("Error: \(String(describing: error))")
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else {
//                print("Invalid response.")
//                return
//            }
//            
//            guard response.statusCode >= 200 && response.statusCode < 300 else {
//                print("Response code should be 2xx, but is \(response.statusCode)")
//                return
//            }
            
//            print("Successfully downloaded data.")
//            print(data)
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString ?? "")
            
            // We can make these above in combine
            guard 
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data.")
                return
            }
            
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPost)
            }
            
        }.resume()
         */
    }
    
    func downloadData(fromData url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }
            completionHandler(data)
            
        }.resume()
    }
}

struct MyDownloadWithEscaping: View {
    @StateObject var vm = MyDownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    MyDownloadWithEscaping()
}
