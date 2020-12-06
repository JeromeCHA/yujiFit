//
//  Training.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/29.
//  Copyright © 2020 jerome. All rights reserved.
//

import RealmSwift

protocol TrainingValue {

}

class Training: Object, TrainingValue {
    @objc dynamic var id: Int = Int(Date().timeIntervalSince1970 * 1000)
    @objc dynamic var name = ""
    @objc dynamic var image: Data? = nil
    var exercices = List<Exercice>()
    @objc dynamic let created_date = Date()

    // Primary Key
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
