//
//  FourthViewController.swift
//  TabTEst
//
//  Created by Anoop M on 2020-09-13.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    private lazy var btn: UIButton = {
        let btn = ViewFactory.createASimpleButtonWith(title: "Remove Me")
        btn.addTarget(self, action: #selector(removeMe), for: .touchUpInside)
        return btn
    }()
    private lazy var stackView: UIStackView = {
        let view = ViewFactory.createASimpleStackView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fourth"
        self.view.backgroundColor = .white
        setUpUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FourthViewController")
    }

    func setUpUI() {
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
        
        stackView.addArrangedSubview(btn)
    }
    @objc private func removeMe() {
        
        MainTabBarManager.shared().remove(item: .four)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
