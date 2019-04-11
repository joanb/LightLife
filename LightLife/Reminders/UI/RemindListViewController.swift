//
//  CollectionViewController.swift
//  LightLife
//
//  Created by joan barroso on 03/04/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class RemindListViewController: UICollectionViewController {
    
    var reminders: Results<Reminder>?
    var origin: Priority?
    var presenter: RemindersPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewReady()
        print("came from \(String(describing: origin))")
    }
    
    func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(showAddReminderAlert))
    }
    
    @objc func showAddReminderAlert() {
        let alert = UIAlertController(title: "Recordatório \(origin!.rawValue)", message: "Añade un nuevo recordatório", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            strongSelf.presenter?.onAddReminderClick(reminderText: (alert.textFields?[0].text)!, priority: strongSelf.origin!)
        }))
        
        alert.addTextField(configurationHandler: { _ in})
        self.present(alert, animated: true, completion: nil)
    }
    
    func showReminders(reminders: Results<Reminder>) {
        self.reminders = reminders
    }
}

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

        cell.reminderTitle.text = reminder.title
        return cell
    }
}
