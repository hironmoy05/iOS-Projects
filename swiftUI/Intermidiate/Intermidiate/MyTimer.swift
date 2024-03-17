//
//  MyTimer.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 17/03/24.
//

import SwiftUI

struct MyTimer: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
//    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
//    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var currentDate = Date()
    // Current time
    /*
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    */
    
    // Animation Counter
    @State var count: Int = 0
     
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.yellow)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(5)
            })
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            
//            HStack {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 100)
//            .foregroundStyle(.white)
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
//            Text(finishedText ?? "\(count)")
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
//            Text(dateFormatter.string(from: currentDate))
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
        }
        .onReceive(timer, perform: { _ in
            withAnimation {
                count = count == 5 ? 1 : count + 1
            }
        })
        
//        .onReceive(timer, perform: { _ in
////            if count == 3 {
////                count = 0
////            } else {
////                count += 1
////            }
//            // or
//            withAnimation(.easeInOut(duration: 0.5)) {
//                count = count == 3 ? 0 : count + 1
//            }
//        })
        
//        .onReceive(timer, perform: { _ in
//            updateTimeRemaining()
//        })
        
//        .onReceive(timer, perform: { _ in
//            if count <= 1 {
//                finishedText = "Wow!"
//            } else {
//                count -= 1
//            }
//        })
//        .onReceive(timer, perform: { value in
//            currentDate = value
//        })
    }
}

#Preview {
    MyTimer()
}
