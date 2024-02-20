//
//  SwiftCustomDataTypes(Structs).swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct SwiftCustomDataTypes_Structs_: View {
    @State var users: [UserModel] = [
//        "Nick", "Emly", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Mike", userName: "mike1995", followerCount: 200, isVerified: false),
        UserModel(displayName: "Ninja", userName: "ninja2", followerCount: 300, isVerified: true),
        UserModel(displayName: "Chris", userName: "chrish2009", followerCount: 88, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                .padding(.vertical, 10)
                }
//                ForEach(users, id:\.self) { name in
//                    HStack(spacing: 15.0) {
//                        Circle()
//                            .frame(width: 35, height: 35)
//                        Text(name)
//                    }
//                    .padding(.vertical, 10)
//                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

#Preview {
    SwiftCustomDataTypes_Structs_()
}
