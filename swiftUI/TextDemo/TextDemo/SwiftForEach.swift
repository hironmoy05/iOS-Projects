//
//  SwiftForEach.swift
//  TextDemo
//
//  Created by Gaurav Sara on 06/02/24.
//

import SwiftUI

struct SwiftForEach: View {
    let data: [String] = ["Apple", "Banana", "Guava", "Grape"]
    
    var body: some View {
//        VStack {
//            ForEach(1..<3) { index in
//                HStack {
//                    Image(systemName: "xmark")
//                        .frame(width: 50, height: 50)
//                        .background(.purple)
//                    Text("HI \(index)")
//                        .font(.title)
//                        .bold()
//                }
//            }
//        }
        
        VStack(alignment: .leading) {
            ForEach(data.indices, id: \.self) { index in
                HStack {
                    Image(systemName: "xmark")
                        .frame(width: 50, height: 50)
                        .background(.purple)
                    Text("\(data[index]): \(index)")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    SwiftForEach()
}
