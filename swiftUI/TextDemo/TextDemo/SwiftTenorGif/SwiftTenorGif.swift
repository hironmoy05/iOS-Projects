//
//  SwiftTenorGif.swift
//  TextDemo
//
//  Created by Gaurav Sara on 16/02/24.
//

import SwiftUI
import WebKit

struct SwiftTenorGif: View {
    @StateObject var viewModel = GIFViewModel()
    
    var body: some View {
        VStack {
            Text("Hello")
//                .onAppear {
//                    viewModel.fetchFeaturedGIF()
//                }
            if !viewModel.gif.isEmpty {
                WebView(url: (URL(string: viewModel.gif[0].imageURL) ?? URL(string: "")!))
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchGIF()
                    }
            }
        }
        .padding()
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    SwiftTenorGif()
}
