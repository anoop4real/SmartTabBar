//
//  ViewFactory.swift
//  TabTEst
//
//  Created by Anoop M on 2020-09-13.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory {
    
    
    class func createASimpleButtonWith(title: String) ->UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(title, for: .normal)
        return btn
    }
    
    class func createASimpleStackView() ->UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
