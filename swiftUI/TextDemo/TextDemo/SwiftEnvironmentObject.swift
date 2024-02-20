//
//  SwiftEnvironmentObject.swift
//  TextDemo
//
//  Created by Gaurav Sara on 20/02/24.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct SwiftEnvironmentObject: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }

                }
            }
            .navigationTitle("iOS Navigate")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            NavigationLink(destination: FinalView()) {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            
        }
    }
}

struct FinalView: View {
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.title)
            }
        }
    }
}

#Preview {
    SwiftEnvironmentObject()
}
