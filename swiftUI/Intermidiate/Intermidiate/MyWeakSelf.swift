//
//  MyWeakSelf.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 06/03/24.
//

import SwiftUI

struct MyWeakSelf: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay (
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .bold()
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing)
            , alignment: .topTrailing
        )
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DEINITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "NEW DATA!!!!"
        }
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

#Preview {
    MyWeakSelf()
}
