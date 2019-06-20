//
//  RemindersPresenter.swift
//  LightLife
//
//  Created by joan barroso on 07/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation

class RemindersPresenter: NSObject {
    
    let viewController: RemindListViewController
    let reminderDisk: ReminderLocalDataSource
    let notifications: Notifications
    
    init(viewController: RemindListViewController, reminderLocalDataSource: ReminderLocalDataSource, notifications: Notifications) {
        self.viewController = viewController
        self.reminderDisk = reminderLocalDataSource
        self.notifications = notifications
    }
    
    @objc
    func addTapped() {
        viewController.showAddReminderAlert()
    }
    
    func onItemDelete(reminder: Reminder) {
        let reminders = reminderDisk.deleteReminder(reminder: reminder)
        viewController.showReminders(reminders: reminders)
    }
    
    func onViewReady() {
        viewController.configureNavBar()
        let reminders = reminderDisk.getAll()
        viewController.showReminders(reminders: reminders)
    }
    
    func onAddReminderClick(reminderText: String, priority: Priority) {
        let reminder  = Reminder(title: reminderText, priority: priority)
        switch priority{
        case Priority.Green:
            notifications.scheduleGreenNotification(reminder: reminder)
        case Priority.Yellow:
            notifications.scheduleYellowNotification(reminder: reminder)
        case Priority.Red:
            notifications.scheduleRedNotification(reminder: reminder)
        }
        reminderDisk.save(reminder: reminder)
        let reminders = reminderDisk.getAll()
        viewController.showReminders(reminders: reminders)
    }
    
    func deleteReminder() {}
}
