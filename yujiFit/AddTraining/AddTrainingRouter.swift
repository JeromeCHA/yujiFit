//
//  AddTrainingRouter.swift
//  yujiFit
//
//  Created by jerome cha on 2020/12/06.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class AddTrainingRouter {

    private var viewController =  AddTrainingViewController()

    func getInitViewController() -> AddTrainingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddTrainingViewController") as? AddTrainingViewController {
            viewController = vc
        }
        initViper()
        return viewController
    }

    private func initViper() {
        var presenter = AddTrainingPresenter()

        viewController.presenter = presenter
        presenter.router = self
    }

}
