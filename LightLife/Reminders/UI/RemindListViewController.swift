//
//  CollectionViewController.swift
//  LightLife
//
//  Created by joan barroso on 03/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RemindListViewController: UICollectionViewController {
    
    let reminders : [Reminder] = [
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "urgente", priority: Priority.Green),
        Reminder(title: "Super urgente", priority: Priority.Green)
    ]
    var origin: Priority?
    var presenter: RemindersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewReady()
        print("came from \(String(describing: origin))")
    }
    
    func configureNavBar() {
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(presenter!.addTapped))
    }
    
    func showAddReminderAlert() {
        let alert = UIAlertController(title: "Recordatório \(String(describing: origin))", message: "Añade un nuevo recordatório", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            strongSelf.presenter?.onAddReminderClick(reminderText: (alert.textFields?[0].text)!, priority: strongSelf.origin!)
        }))
        
        alert.addTextField(configurationHandler: { (UITextField) in})
        self.present(alert, animated: true, completion: nil)
    }
}

extension RemindListViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminders.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReminderCellCollectionViewCell

        let reminder = reminders[indexPath.item]
        
        cell.reminderTitle.text = reminder.title
        return cell
    }
}

