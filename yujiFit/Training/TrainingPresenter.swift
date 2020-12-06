//
//  TrainingPresenter.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import Combine
import Foundation
import SCLAlertView

class TrainingPresenter: ObservableObject {
    var router: TrainingRouter?
    var interactor: TrainingInteractor?
    @Published private(set) var list_data = [TrainingValue]()

    func updateList() {
        if let allValues = interactor?.getAll() {
            list_data = allValues
        }
    }

    func addTraining() {
        router?.showAddTraining()
    }

    func addSingleValue() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        let textField = alert.addTextField("Name")
        alert.addButton("Add") { [weak self] in
            if let text = textField.text {
                let singleValue = SingleValue()
                singleValue.name = text
                self?.interactor?.add(singleValue: singleValue)
                self?.updateList()
            }
        }
        alert.showEdit("Add a single value", subTitle: "")
    }
}
