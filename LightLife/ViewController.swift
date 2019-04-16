//
//  ViewController.swift
//  LightLife
//
//  Created by joan barroso on 30/03/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        customise()
    }
    
    func customise() {
        redButton.layer.cornerRadius = 50
        yellowButton.layer.cornerRadius = 50
        greenButton.layer.cornerRadius = 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RemindListViewController else {
          return
        }
        let prioritySelected: Priority
        switch segue.identifier {
        case "redSegue":
            prioritySelected = Priority.Red
        case "yellowSegue":
            prioritySelected = Priority.Yellow
        case "greenSegue":
            prioritySelected = Priority.Green
        default:
            prioritySelected = Priority.Green
        }
        destination.origin = prioritySelected
        destination.presenter = RemindersPresenter(viewController: destination, reminderLocalDataSource: ReminderLocalDataSource(), notifications: Notifications())
    }
}
