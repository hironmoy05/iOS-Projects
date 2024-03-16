//
//  MyDownloadWithCombine.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 16/03/24.
//

import SwiftUI
import Combine

struct PostModelAgain:Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModelAgain] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Combine discussion
        /*
         1. Sign up for monthly subscription for package to be delivered
         2. The company would make the package behind the scene
         3. Receive the package at your front door
         4. Make sure the box isn't damaged
         5. Open and make sure the itme is correct
         6. Use the item!!!!
         7. cancelable at any time!!
         
         
         1. create the publisher
         2. subscribe publisher on background thread. The 'dataTaskPublisher' is by default running on background thread. But some time we're gonna create publisher instead of using "dataTaskPublisher" here and they will not explicitly on the background thread. So we wanna have to subscribe there.
         3. Receive on main thread
         4. TryMap (check that the data is good)
         5. Decode (decode data into postModels)
         6. Sink (Put the item into our app)
         7. store (cancel subscription if needed)
         */
        URLSession.shared.dataTaskPublisher(for: url)
        //            .subscribe(on: DispatchQueue.global(qos: .background)) // 'dataTaskPublisher' runs default at background thread
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
//            .tryMap { (data, response) -> Data in
//                guard
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
            .decode(type: [PostModelAgain].self, decoder: JSONDecoder())
            .replaceError(with: []) // This we can use if not gonna say anything like with alert or print
            .sink(receiveValue: { [weak self] posts in
                self?.posts = posts
            })
//            .sink { completion in
//                print("COMPLETION: \(completion)")
//                switch completion {
//                case .finished:
//                    print("Finished")
//                case.failure(let error):
//                    print("There was an error \(error)")
//                }
//            } receiveValue: { [weak self] posts in
//                self?.posts = posts
//            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct MyDownloadWithCombine: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    
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
        }.listStyle(.plain)
    }
}

#Preview {
    MyDownloadWithCombine()
}
