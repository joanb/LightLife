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
    @objc let title: String
    @objc let priority: String
    
    init(title: String, priority: Priority) {
        self.title = title
        self.priority = priority.rawValue
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

enum Priority: String {
    case Green = "verde"
    case Yellow = "ámbar"
    case Red = "rojo"
}
