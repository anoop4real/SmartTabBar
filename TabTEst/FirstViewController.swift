//
//  FirstViewController.swift
//  TabTEst
//
//  Created by Anoop M on 2020-08-31.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private lazy var btn: UIButton = {
        let btn = ViewFactory.createASimpleButtonWith(title: "Show Fourth")
        btn.addTarget(self, action: #selector(addFourth), for: .touchUpInside)
        return btn
    }()
    private lazy var btn2: UIButton = {
        let btn = ViewFactory.createASimpleButtonWith(title: "Remove Fourth")
        btn.addTarget(self, action: #selector(removeFourth), for: .touchUpInside)
        return btn
    }()
    
    private lazy var btn3: UIButton = {
        let btn = ViewFactory.createASimpleButtonWith(title: "Show Badge on 3")
        btn.addTarget(self, action: #selector(showBadge), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let view = ViewFactory.createASimpleStackView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "First"
        self.view.backgroundColor = .white
        setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstViewController")
    }
    
    func setUpUI() {
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
        
        stackView.addArrangedSubview(btn)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
    }

    @objc private func addFourth() {
        
        MainTabBarManager.shared().add(item: .four, at: 3)
    }
    
    @objc private func removeFourth() {
        
        MainTabBarManager.shared().remove(item: .four)
    }
    @objc private func showBadge() {
        
        MainTabBarManager.shared().configureBadgeFor(item: .three, with: "10")
    }
}

