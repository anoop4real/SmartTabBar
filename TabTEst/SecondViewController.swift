//
//  SecondViewController.swift
//  TabTEst
//
//  Created by Anoop M on 2020-08-31.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Second"
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController")
    }

}

