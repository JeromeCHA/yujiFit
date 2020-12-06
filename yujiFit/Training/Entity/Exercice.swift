//
//  Exercice.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/29.
//  Copyright © 2020 jerome. All rights reserved.
//

import RealmSwift

class Exercice: Object {
    @objc dynamic var id: Int = Int(Date().timeIntervalSince1970 * 1000)
    @objc dynamic var name = ""
    @objc dynamic var image: Data? = nil
    @objc dynamic var weight = 0
    @objc dynamic var reps = 0
    @objc dynamic var rest_time = 0

    // Primary Key
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}
