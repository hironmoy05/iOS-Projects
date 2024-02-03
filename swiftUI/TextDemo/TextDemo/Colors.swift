//
//  Colors.swift
//  TextDemo
//
//  Created by Gaurav Sara on 03/02/24.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color.primary
//                Color(red: 0, green: 0.3285208941, blue: 0.5748849511, opacity: 1)
//                Color(UIColor.secondarySystemBackground)
                Color("customColor")
            )
            .frame(width: 300, height: 200)
//            .shadow(radius: 10)
//            .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
            .shadow(color: Color("customColor").opacity(0.5), radius: 10, x: 25, y: 25)
    }
}

#Preview {
    Colors()
}
