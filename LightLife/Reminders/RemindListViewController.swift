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
    
    let reminders : [Reminder] = [Reminder(), Reminder()]
    var origin: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("came from \(String(describing: origin))")
    }
}

extension RemindListViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}

extension RemindListViewController {
    
}
