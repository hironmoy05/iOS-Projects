//
//  SwiftDatePicker.swift
//  TextDemo
//
//  Created by Gaurav Sara on 19/02/24.
//

import SwiftUI

struct SwiftDatePicker: View {
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2024)) ?? Date()
    let endingDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
    
    
    var body: some View {
        VStack {
            Text("Selected Date is: ")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            Text(selectedDate.description)
                .font(.title)
            //        DatePicker("Select a date", selection: $selectedDate)
            //        DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .tint(Color.red)
            //            .datePickerStyle(GraphicalDatePickerStyle())
            //            .datePickerStyle(WheelDatePickerStyle())
                .datePickerStyle(CompactDatePickerStyle())
        }
    }
}

#Preview {
    SwiftDatePicker()
}
