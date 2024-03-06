//
//  MyTypeAliase.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 07/03/24.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct MyTypeAliase: View {
    @State var item = TVModel(title: "title", director: "Joe", count: 5)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    MyTypeAliase()
}
