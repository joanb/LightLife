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
    
    init(viewController: RemindListViewController, reminderLocalDataSource: ReminderLocalDataSource) {
        self.viewController = viewController
        self.reminderDisk = reminderLocalDataSource
    }
    
    @objc
    func addTapped() {
        viewController.showAddReminderAlert()
    }
    
    func onViewReady() {
     viewController.configureNavBar()
    }
    
    func onAddReminderClick(reminderText: String, priority: Priority) {
        let reminder  = Reminder(title: reminderText, priority: priority)
        reminderDisk.save(reminder: reminder)
    }
    
    func deleteReminder() {}
}
