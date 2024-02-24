//
//  SwiftPopOver.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftNativePopOver: View {
    @State private var showPopOver: Bool = false
    @State private var feedbackOptions: [String] = [
        "Very good 😄",
        "Average 🙂",
        "Very angry 😡"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button("CLICK ME") {
                    showPopOver.toggle()
                }
                //            .popover(isPresented: $showPopOver) {
                //                Text("Hello Subscribers!")
                //                    .padding()
                //                    .presentationCompactAdaptation(.sheet)
                //                    .presentationCompactAdaptation(.fullScreenCover)
                //                    .presentationCompactAdaptation(.popover)
                .padding()
                .background(.yellow)
                .popover(isPresented: $showPopOver, attachmentAnchor: .point(.top), content: {
//                    Text("Hello Subscribers!")
//                        .padding()
//                        .presentationCompactAdaptation(.popover)
                    
//                    VStack(alignment: .leading, spacing: 12, content: {
//                        ForEach(feedbackOptions, id:\.self) { option in
//                            Button(option) {
//                                
//                            }
//                            
//                            if option != feedbackOptions.last {
//                                Divider()
//                            }
//                        }
//                    })
//                    .padding(20)
//                    .presentationCompactAdaptation(.popover)
                    
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12, content: {
                            ForEach(feedbackOptions, id:\.self) { option in
                                Button(option) {
    
                                }
    
                                if option != feedbackOptions.last {
                                    Divider()
                                }
                            }
                        })
                        .padding(20)
                    }
//                    .presentationCompactAdaptation(.popover)
                    .presentationCompactAdaptation(horizontal: .fullScreenCover, vertical: .popover)
                })
            }
        }
    }
}

#Preview {
    SwiftNativePopOver()
}
