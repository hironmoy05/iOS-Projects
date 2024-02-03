//
//  ContentView.swift
//  TextDemo
//
//  Created by Gaurav Sara on 03/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!".capitalized)
            .font(.system(size: 24, weight: .heavy, design: .serif))
//            .fontWeight(.heavy)
//            .bold()
//            .italic()
//            .strikethrough(true, color: .white)
//            .underline(true, color: .gray)
            .foregroundStyle(.red)
//            .baselineOffset(20.0)
//            .kerning(10.0)
            .multilineTextAlignment(.center)
            .frame(width: 300, height: 200.0, alignment: .center)
            .border(.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .minimumScaleFactor(0.4)
    }
}

#Preview {
    ContentView()
}
