//
//  Reminder.swift
//  LightLife
//
//  Created by joan barroso on 02/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Reminder: Object {
    @objc var title: String = ""
    @objc var priority: String = ""
    
    convenience init(title: String, priority: Priority) {
        self.init()
        self.title = title
        self.priority = priority.rawValue
    }
}

enum Priority: String {
    case Green = "verde"
    case Yellow = "ámbar"
    case Red = "rojo"
}
