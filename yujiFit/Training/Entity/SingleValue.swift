//
//  SingleValue.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/29.
//  Copyright © 2020 jerome. All rights reserved.
//

import RealmSwift

class SingleValue: Object, TrainingValue {
    @objc dynamic var id: Int = Int(Date().timeIntervalSince1970 * 1000)
    @objc dynamic var name = ""
    var values = List<Value>()
    @objc dynamic let created_date = Date()

    // Primary Key
    override static func indexedProperties() -> [String] {
        return ["id"]
    }
}

class Value: Object {
    @objc dynamic var value: Float = 0.0
    @objc dynamic let created_date = Date()
}
