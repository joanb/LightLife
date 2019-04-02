//
//  RemindListViewController.swift
//  LightLife
//
//  Created by joan barroso on 31/03/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit

class RemindListViewController: UICollectionViewController {

    private let reuseIdentifier = "ReminderCell"
    let reminders : [Reminder] = [Reminder(), Reminder()]
    var origin: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("came from \(String(describing: origin))")
    }
}

extension RemindListViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return reminders.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminders.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}

extension RemindListViewController {
    
}
