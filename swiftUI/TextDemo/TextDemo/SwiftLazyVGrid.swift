//
//  SwiftLazyVGrid.swift
//  TextDemo
//
//  Created by Gaurav Sara on 06/02/24.
//

import SwiftUI

struct SwiftLazyVGrid: View {
    
//    let columns: [GridItem] = [
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(100), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil)
//    ]
//    
//    var body: some View {
//        LazyVGrid(columns:  columns) {
//            ForEach(1..<60) { index in
//                Rectangle()
//                    .frame(height: 50)
//            }
//        }
//    }
    
    
    
    
    
    
    
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
//    
//    var body: some View {
//        LazyVGrid(columns:  columns) {
//            ForEach(1..<60) { index in
//                Rectangle()
//                    .frame(height: 50)
//            }
//        }
//        .padding(.horizontal, 16)
//    }
    
    
    
    
    
    
    
//    let columns: [GridItem] = [
//        GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil),
//        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil),
//    ]
//    
//    var body: some View {
//        LazyVGrid(columns:  columns) {
//            ForEach(1..<60) { index in
//                Rectangle()
//                    .frame(height: 50)
//            }
//        }
//    }
    
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
//    
//    var body: some View {
//        ScrollView {
//            Rectangle()
//                .fill(.white)
//                .frame(height: 400)
//            
//            LazyVGrid(columns:  columns) {
//                ForEach(1..<60) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
//        }
//    }
    
    
    
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.indigo)
                .frame(height: 300)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(header:
                                Text("Section 1")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.blue)
                    ) {
                        ForEach(1..<60) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    }
                    
                    Section(header:
                                Text("Section 1")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.red)
                    ) {
                        ForEach(1..<60) { index in
                            Rectangle()
                                .fill(.purple)
                                .frame(height: 150)
                        }
                    }
                })
        }
    }

}

#Preview {
    SwiftLazyVGrid()
}
