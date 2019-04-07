//
//  Reminder.swift
//  LightLife
//
//  Created by joan barroso on 02/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation

struct Reminder {
    let title: String
    let priority: Priority
}

enum Priority {
    case Green
    case Yellow
    case Red
}
