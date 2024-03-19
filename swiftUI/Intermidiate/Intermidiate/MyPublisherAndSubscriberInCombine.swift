//
//  MyPublisherAndSubscriberInCombine.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 17/03/24.
//

import SwiftUI
import Combine

class MyPublisherAndSubscriberInCombineViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
//    var timer: AnyCancellable?
    
    @Published var textFieldText: String = ""
    @Published var textIsValid = false
    @Published var showButton = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                }
                
                return false
            }
//            .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.count += 1
                
//                if count >= 10 {
//                    for item in self.cancellables {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
        
//        timer = Timer
//            .publish(every: 1.0, on: .main, in: .common)
//            .autoconnect()
//            .sink { [weak self] _ in
//                guard let self else { return }
//                self.count += 1
//                
//                if count >= 10 {
//                    self.timer?.cancel()
//                }
//            }
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self else { return }
                
                if isValid && count > 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct MyPublisherAndSubscriberInCombine: View {
    @StateObject var vm = MyPublisherAndSubscriberInCombineViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type text here...", text: $vm.textFieldText)
                .padding(.leading)
                .font(.headline)
                .frame(height: 55)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.title)
                        .padding(.trailing)
                        ,
                    alignment: .trailing
                    
                )
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10), style: FillStyle())
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

#Preview {
    MyPublisherAndSubscriberInCombine()
}
