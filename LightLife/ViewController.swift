//
//  ViewController.swift
//  LightLife
//
//  Created by joan barroso on 30/03/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinaton = segue.destination as? RemindListViewController else {
          return
        }
        destinaton.origin = (sender as? UIStoryboardSegue)?.identifier ?? "unknown"
    }
}

