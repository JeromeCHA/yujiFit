//
//  TrainViewController.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class TrainViewController: UIViewController {

    var presenter: TrainPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trains"
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }

}
