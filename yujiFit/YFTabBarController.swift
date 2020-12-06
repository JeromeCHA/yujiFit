//
//  YFTabBarController.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class YFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
    }

    private func initTabBar() {
        let homeViewController = HomeRouter().getInitViewController()
        let homeIcon = UIImage(named: "home")
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
        
        let trainingViewController = TrainingRouter().getInitViewController()
        let trainingIcon = UIImage(named: "training")
        trainingViewController.tabBarItem = UITabBarItem(title: "Training", image: trainingIcon, tag: 1)

        viewControllers = [homeViewController, trainingViewController]
    }
}
