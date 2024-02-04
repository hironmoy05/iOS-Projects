//
//  SwiftFrameImportant.swift
//  TextDemo
//
//  Created by Gaurav Sara on 04/02/24.
//

import SwiftUI

struct SwiftFrameImportant: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(.green)
//            .frame(width: 300, height: 300, alignment: .center)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.blue)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.pink)
            .frame(height: 400)
            .background(.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.yellow)
    }
}

#Preview {
    SwiftFrameImportant()
}
