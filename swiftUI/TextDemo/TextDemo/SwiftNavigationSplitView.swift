//
//  SwiftNavigationSplitView.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

// NavigationSplitView -> iPad, macOS, visionOS

struct SwiftNavigationSplitView: View {
    var body: some View {
        NavigationSplitView {
            Color.red
        } detail: {
            Color.blue
        }

    }
}

#Preview {
    SwiftNavigationSplitView()
}
