//
//  NotificationsPermission.swift
//  LightLife
//
//  Created by joan barroso on 14/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation
import UserNotifications

struct Notifications {

    func scheduleGreenNotification(reminder: Reminder) {
        let content = getContent(title: "GREEN ALERT", message: reminder.title)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "greenNotification", content: content, trigger: trigger)
        addNotification(request: request)
    }
    
    func scheduleYellowNotification(reminder: Reminder) {
        let content = getContent(title: "YELLOW ALERT", message: reminder.title)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600*24, repeats: true)
        let request = UNNotificationRequest(identifier: "yellowNotification", content: content, trigger: trigger)
        addNotification(request: request)
    }
    
    func scheduleRedNotification(reminder: Reminder) {
        let content = getContent(title: "RED ALERT", message: reminder.title)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600*24*7, repeats: true)
        let request = UNNotificationRequest(identifier: "redNotification", content: content, trigger: trigger)
        addNotification(request: request)
    }
    
    private func addNotification(request: UNNotificationRequest) {
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    private func getContent(title: String, message: String) -> UNNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = message
        content.categoryIdentifier = "INVITATION"
        content.sound = UNNotificationSound.default
        return content
    }
}
