//
//  SwiftContentUnavailableView.swift
//  TextDemo
//
//  Created by Gaurav Sara on 25/02/24.
//

import SwiftUI

struct SwiftContentUnavailableView: View {
    var body: some View {
//        ContentUnavailableView(
//            "No Internaet Connection",
//            systemImage: "wifi.slash",
//            description: Text("Please connect to the internet and try again."))
//        ContentUnavailableView.search
        ContentUnavailableView.search(text: "abc")
    }
}

#Preview {
    SwiftContentUnavailableView()
}
