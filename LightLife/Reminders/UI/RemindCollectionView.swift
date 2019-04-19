//
//  RemindCollectionView.swift
//  LightLife
//
//  Created by joan barroso on 19/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

extension RemindListViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminders?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ReminderCellCollectionViewCell,
            let reminder = reminders?[indexPath.item]
            else { return UICollectionViewCell() }
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(someMethod(sender:)) )
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        cell.addGestureRecognizer(leftSwipe)
        
        cell.backgroundColor = UIColor.blue
        cell.reminderTitle.text = reminder.title
        return cell
    }
}
