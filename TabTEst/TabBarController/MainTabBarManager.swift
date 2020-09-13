//
//  MainTabBarManager.swift
//  TabTEst
//
//  Created by Anoop M on 2020-09-13.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import Foundation
import UIKit

enum TabOrder {
    case base
    case jumbled
    
    var tabBarControllerItems: [TabBarControllerItem] {
        switch self {
        case .base:
            return [.one, .two, .three]
        case .jumbled:
            return [.three, .one, .two]
        }
    }
}
class MainTabBarManager {
    private static let _shared = MainTabBarManager()
    private var currentTabBarController: MainTabBarController!
    // Singleton
    private init() {}
    
    class func shared() -> MainTabBarManager {
        return _shared
    }
    
    func loadTabBar(with tabOrder:TabOrder = .base, selectedTabItem: TabBarControllerItem? = nil) {
        currentTabBarController = MainTabBarController(with: tabOrder.tabBarControllerItems, selectedItem: selectedTabItem)
        
        if let window = UIWindow.key {
            window.rootViewController = currentTabBarController
        }
    }
    
    func configureBadgeFor(item: TabBarControllerItem, with value: String?) {
        currentTabBarController.configureBadgeFor(item: item, with: value)
    }
    
    // Convenience function to switch between tabs
    func select(item: TabBarControllerItem) {
        if let window = UIWindow.key, let rootVC = window.rootViewController as? MainTabBarController {
            rootVC.select(item: item)
        }
    }
    
    func remove(item: TabBarControllerItem) {
        currentTabBarController.remove(item: item)
    }
    
    func add(item: TabBarControllerItem, at index: Int) {
        currentTabBarController.add(item: item, at: index)
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
        // Uncomment for older code
//        else if let appdelegate = UIApplication.shared.delegate as? AppDelegate, let window = appdelegate.window {
//            return window
//        }
    }
}
