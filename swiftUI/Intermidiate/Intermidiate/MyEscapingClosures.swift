//
//  MyEscapingClosures.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 07/03/24.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        let newData = downloadData()
//        text = newData
        
//        downloadData2 { data in
//            text = data
//        }
        
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
        
        downloadData4 { [weak self] result in
            self?.text = result.data
        }
    }
    
//    func downloadData() -> String {
//        return "New Data!"
//    }
    
//    func downloadData2(completionHandler: (_ data: String) -> Void) {
//        completionHandler("New Data!")
//    }
    
//    func downloadData3(completionHandler: (_ data: String) -> Void) {
//        completionHandler("New Data!")
//    }
    // or
//    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            completionHandler("New Data!")
//        }
//    }
    
//    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            let result = DownloadResult(data: "New Data!")
//            completionHandler(result)
//        }
//    }
    // with typealias
    func downloadData4(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct MyEscapingClosures: View {
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    MyEscapingClosures()
}
