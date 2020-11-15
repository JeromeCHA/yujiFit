//
//  MainRouter.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class HomeRouter {

    private var viewController =  HomeViewController()

    func getInitViewController() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            viewController = vc
        }
        initViper()
        return viewController
    }

    private func initViper() {
        let presenter = HomePresenter()

        viewController.presenter = presenter
        presenter.router = self
    }

}
