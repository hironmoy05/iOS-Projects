//
//  MyLocalNotification.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 01/03/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAutohorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error {
                print("Error \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was soooo easy!"
        content.sound = .default
        content.badge = 1
        
        
        // Time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 13
//        dateComponents.minute = 47
//        dateComponents.weekday = 1
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Location
        let coordinates = CLLocationCoordinate2D(latitude: 40.0, longitude: 50.0)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancleNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct MyLocalNotification: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAutohorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancle Notification") {
                NotificationManager.instance.cancleNotification()
            }
        }
        .onAppear {
//            UIApplication.shared.applicationIconBadgeNumber = 0 // depricated
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    MyLocalNotification()
}
