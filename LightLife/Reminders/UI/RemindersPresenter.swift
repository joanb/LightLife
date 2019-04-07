//
//  RemindersPresenter.swift
//  LightLife
//
//  Created by joan barroso on 07/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation

class RemindersPresenter: NSObject {
    
    let ui: RemindListViewController
    
    init(viewController: RemindListViewController) {
        self.ui = viewController
    }
    
    @objc
    func addTapped() {
        ui.showAddReminderAlert()
    }
    
    func onViewReady() {
     ui.configureNavBar()
    }
    
    func onAddReminderClick(reminderText: String, priority: Priority) {
        
    }
    
    func deleteReminder() {
        
    }
}
