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
    @objc dynamic var title: String = ""
    @objc dynamic var priority: String = ""
    
    convenience init(title: String, priority: Priority) {
        self.init()
        self.title = title
        self.priority = priority.rawValue
    }
    
    func getColor() -> UIColor? {
        guard let priorityType = Priority(rawValue: self.priority)
            else { return UIColor.red }
        
        switch priorityType {
        case Priority.Green:
            return UIColor.green
        case Priority.Yellow:
            return UIColor.yellow
        case Priority.Red:
            return UIColor.red
        }
    }
}

enum Priority: String {
    case Green = "verde"
    case Yellow = "ámbar"
    case Red = "rojo"
}
