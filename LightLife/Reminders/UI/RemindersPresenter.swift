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
    
    init(viewController: RemindListViewController) {
        self.viewController = viewController
    }
    
    @objc
    func addTapped() {
        viewController.showAddReminderAlert()
    }
    
    func onViewReady() {
     viewController.configureNavBar()
    }
    
    func onAddReminderClick(reminderText: String, priority: Priority) {
        
    }
    
    func deleteReminder() {}
}
