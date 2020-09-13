//
//  MainTabBarController.swift
//  TabTEst
//
//  Created by Anoop M on 2020-09-13.
//  Copyright © 2020 Anoop M. All rights reserved.
//

import UIKit

enum TabBarControllerItem {
     case one
     case two
     case three
     case four
    
    var tabBarItem: UITabBarItem {
        
        switch self {
        case .one:
            return UITabBarItem(title: "One", image: UIImage(systemName: "bell"),selectedImage:UIImage(systemName: "bell.fill") )
        case .two:
            return UITabBarItem(title: "Two", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        case .three:
            return UITabBarItem(title: "Three", image: UIImage(systemName: "tortoise"), selectedImage: UIImage(systemName: "tortoise.fill"))
        case .four:
            return UITabBarItem(title: "Four", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        }
    }
}
class MainTabBarController: UITabBarController {
    
    private var tabBarControllerItems = [TabBarControllerItem]()
    private var indexToSelect = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedIndex = indexToSelect
    }
    
    init(with tabBarControllerItems: [TabBarControllerItem], selectedItem: TabBarControllerItem? = nil) {
        super.init(nibName: nil, bundle: nil)

        self.tabBarControllerItems = tabBarControllerItems
        var viewControllers = [UIViewController]()
        for item in tabBarControllerItems {
            guard let vc = fetchViewControllerFor(item: item) else {
                continue
            }
            viewControllers.append(vc)
        }
        self.viewControllers = viewControllers
        if let index = indexOf(item: selectedItem) {
            indexToSelect = index
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(item: TabBarControllerItem, at index: Int) {
        // If an item exists then we should not add it again
        var indexToInsert = index
        if let _ = indexOf(item: item) {
            return
        } else if indexToInsert > tabBarControllerItems.count {
            // If index is greater than count then insert to the last
            indexToInsert = tabBarControllerItems.count
            return
        }

        guard var viewControllers = self.viewControllers, let viewControllerForItem = fetchViewControllerFor(item: item) else { return }
        viewControllers.insert(viewControllerForItem, at: indexToInsert)
        tabBarControllerItems.insert(item, at: indexToInsert)
        self.viewControllers = viewControllers
    }
    
    func remove(item: TabBarControllerItem) {
        if let index = indexOf(item: item) {
            guard var viewControllers = self.viewControllers else { return }
            viewControllers.remove(at: index)
            tabBarControllerItems.remove(at: index)
            self.viewControllers = viewControllers
        }
    }
    // Convenience function to select tabs
    func select(item: TabBarControllerItem) {
        if let index = indexOf(item: item) {
            selectedIndex = index
        }
    }
    // Get the tab item and update the badge value
    func configureBadgeFor(item:TabBarControllerItem, with value: String?) {
        if let index = indexOf(item: item), let item = tabBar.items?[index] {
            if let badgeValue = value, !badgeValue.isEmpty {
                item.badgeValue = value
            } else {
                item.badgeValue = nil
            }
        }
    }
    
    private func indexOf(item: TabBarControllerItem?) -> Int? {
        guard let tabBarItem = item, let index = tabBarControllerItems.firstIndex(of: tabBarItem) else {
            return nil
        }
        return index
    }
    
    private func setUpTabBar() {
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13.0)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        tabBar.barTintColor = UIColor.cyan
        tabBar.tintColor = UIColor.red
    }

    func fetchViewControllerFor(item: TabBarControllerItem) -> UIViewController? {
        switch item {
        case .one:
            let vc = FirstViewController()
            vc.tabBarItem = item.tabBarItem
            let navVC = UINavigationController(rootViewController: vc)
            return navVC
        case .two:
            let vc = SecondViewController()
            vc.tabBarItem = item.tabBarItem
            let navVC = UINavigationController(rootViewController: vc)
            return navVC
        case .three:
            let vc = ThirdViewController()
            vc.tabBarItem = item.tabBarItem
            let navVC = UINavigationController(rootViewController: vc)
            return navVC
        case .four:
            let vc = FourthViewController()
            vc.tabBarItem = item.tabBarItem
            let navVC = UINavigationController(rootViewController: vc)
            return navVC

        }
    }


}
