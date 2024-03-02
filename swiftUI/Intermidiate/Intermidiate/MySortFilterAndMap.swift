//
//  MySortFilterAndMap.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 02/03/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Hironmoy", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 7, isVerified: false)
        let user3 = UserModel(name: nil, points: 4, isVerified: true)
        let user4 = UserModel(name: "Emily", points: 8, isVerified: false)
        let user5 = UserModel(name: "Samantha", points: 9, isVerified: false)
        let user6 = UserModel(name: "Json", points: 6, isVerified: true)
        let user7 = UserModel(name: "Sarah", points: 2, isVerified: false)
        let user8 = UserModel(name: "Lisa", points: 15, isVerified: true)
        let user9 = UserModel(name: nil, points: 12, isVerified: false)
        let user10 = UserModel(name: "Amanda", points: 11, isVerified: true)
        
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
    }
    
    func updateFilteredArray() {
        // sort
        /*
        filteredArray = dataArray.sorted { user1, user2 in
            user1.points > user2.points
        }
        // or
        filteredArray = dataArray.sorted { $0.points < $1.points}
        */
        
        // filter
        /*
        // filteredArray = dataArray.filter({ user in
        //    user.points > 5
        // })
        // or
//        filteredArray = dataArray.filter { user in !user.isVerified }
//        filteredArray = dataArray.filter { user in user.name.contains("i") }
        // or
//      filteredArray = dataArray.filter { $0.points > 7 }
        filteredArray = dataArray.filter { !$0.isVerified }
        */
        
        // map
        /*
//        mappedArray = dataArray.map({ user in
//            user.name
//        })
        // or
//        mappedArray = dataArray.map { $0.name }
        
        // If name is optional use 'compactMap' cause it handle optional, so it'll return a array in which it's not going to include the missing name in final array
//        mappedArray = dataArray.compactMap({ user in
//            user.name
//        })
        // or
        mappedArray = dataArray.compactMap { $0.name }
        */
        
        mappedArray = dataArray
                        .sorted { $0.points > $1.points }
                        .filter { $0.isVerified }
                        .compactMap { $0.name }
    }
}

struct MySortFilterAndMap: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .padding(.horizontal)
//                    .padding(.vertical, -5)
//                }
            }
        }
    }
}

#Preview {
    MySortFilterAndMap()
}
