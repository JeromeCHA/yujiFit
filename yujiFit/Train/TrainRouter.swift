//
//  TrainRouter.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class TrainRouter {

    private var viewController = TrainViewController()

    func getInitViewController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TrainViewController") as? TrainViewController {
            viewController = vc
        }
        initViper()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

    private func initViper() {
        let presenter = TrainPresenter()
        presenter.router = self
        viewController.presenter = presenter
    }
}
