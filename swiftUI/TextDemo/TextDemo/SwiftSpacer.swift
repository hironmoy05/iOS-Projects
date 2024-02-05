//
//  SwiftSpacer.swift
//  TextDemo
//
//  Created by Gaurav Sara on 05/02/24.
//

import SwiftUI

struct SwiftSpacer: View {
    var body: some View {
        //        HStack(spacing: 0) {
        //            Rectangle()
        //                .fill(.blue)
        //                .frame(width: 100, height: 100)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(.orange)
        //
        //            Rectangle()
        //                .fill(.red)
        //                .frame(width: 100, height: 100)
        //        }
        //        .background(.green)
        //        .padding()
        
        //        HStack (spacing: nil) {
        //            Spacer(minLength:  0)
        //                .frame(height: 10)
        //                .background(.white)
        //
        //            Rectangle()
        //                .frame(width: 100, height: 100)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(.white)
        //
        //            Rectangle()
        //                .fill(.red)
        //                .frame(width: 100, height: 100)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(.white)
        //        }
        //        .background(.orange)
        //        .padding(.horizontal, 16)
        //        .background(.green)
            VStack {
                HStack {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                    
                    Spacer()
//                        .frame(height: 10)
//                        .background(.red)
                    
                    Image(systemName: "gear")
                        .font(.largeTitle)
                }
                .font(.title)
//                .background(.yellow)
                .padding(.horizontal, 16)
//                .background(.blue)
                
                Spacer()
//                    .frame(width: 10)
//                    .background(.red)
                
                Rectangle()
                    .fill(.green)
                    .frame(height: 50)
            }
//            .background(.yellow)
    }
}

#Preview {
    SwiftSpacer()
}
