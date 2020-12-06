//
//  TrainingCell.swift
//  yujiFit
//
//  Created by jerome cha on 2020/12/06.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit

class TrainingCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(title: String) {
        self.titleLabel.text = title
    }
}
