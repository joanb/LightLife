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
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "urgente"),
        Reminder(title: "Super urgente")
    ]
    var origin: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("came from \(String(describing: origin))")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        print("asd")
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return (collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "\(ReminderHeader.self)",
            for: indexPath) as? ReminderHeader)!
    }
}

