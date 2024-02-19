//
//  SwiftPicker.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftPicker: View {
    @State var selection: String = "Most Recent"
    @State var filterOptions: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Filter")
                Text(selection)
            }
            .font(.largeTitle)
            //            Picker(
            //                selection: $selection) {
            //                    ForEach(1..<100) { num in
            //                        Text("\(num)")
            //                            .tag("\(num)")
            //                    }
            //                } label: {
            //                    Text("Picker")
            //            }
            //                .pickerStyle(.menu) // default
            
            //            Picker(
            //                selection: $selection) {
            //                    ForEach(1..<100) { num in
            //                        Text("\(num)")
            //                            .tag("\(num)")
            //                    }
            //                    .font(.largeTitle)
            //                    .foregroundStyle(.red)
            //                } label: {
            //                    Text("Picker")
            //            }
            //                .pickerStyle(.wheel)
            VStack {
                Picker(selection: $selection) {
                    ForEach(filterOptions, id: \.self) { option in
                        HStack {
                            Text(option)
//                            Image(systemName: "heart.fill")
                        }
                        .tag(option)
                    }
                } label: {
                    Text("Picker")
                        .font(.title)
                }
                
            }
            .pickerStyle(.palette)
            .background(.green.opacity(0.5))
            .shadow(color: Color.green.opacity(0.4), radius: 10, x: 0, y: 10)
        }
        Rectangle()
            .frame(height: 0.0)
    }
}

#Preview {
    SwiftPicker()
}
