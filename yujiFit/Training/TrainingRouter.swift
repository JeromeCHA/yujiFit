//
//  TrainingRouter.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class TrainingRouter {

    private var viewController = TrainingViewController()

    func getInitViewController() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TrainingViewController") as? TrainingViewController {
            viewController = vc
        }
        initViper()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }

    private func initViper() {
        let presenter = TrainingPresenter()
        let interactor = TrainingInteractor()

        presenter.router = self
        presenter.interactor = interactor

        viewController.presenter = presenter
    }

    // MARK: - Routing
    func showAddTraining() {
        let addTrainingViewController = AddTrainingRouter().getInitViewController()
        addTrainingViewController.modalPresentationStyle = .formSheet
        viewController.present(addTrainingViewController, animated: true, completion: nil)
    }
}
