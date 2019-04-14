//
//  File.swift
//  LightLife
//
//  Created by joan barroso on 09/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation
import RealmSwift

class ReminderLocalDataSource {
    let realm = try! Realm()
    
    func getAll() -> Results<Reminder> {
        return realm.objects(Reminder.self)
    }
    
    func save(reminder: Reminder) {
        try! realm.write {
            realm.add(reminder)
        }
    }
    
    func deleteReminder(reminder: Reminder) -> Results<Reminder> {
        try! realm.write {
            realm.delete(reminder)
        }
        return getAll()
    }
}
