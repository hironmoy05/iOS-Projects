//
//  LongPressGesture.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 26/02/24.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(width: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { isPressing in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(.easeInOut) {
                                    if !isSuccess {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                        
                    } perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
////            .onLongPressGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
        
        
    }
}

#Preview {
    LongPressGesture()
}
