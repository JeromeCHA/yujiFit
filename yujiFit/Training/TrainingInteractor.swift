//
//  TrainingInteractor.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/29.
//  Copyright © 2020 jerome. All rights reserved.
//

import RealmSwift

class TrainingInteractor {
    private let realm = try! Realm()

    // MARK: - Add / Update
    func add(training: Training) {
        try! realm.write {
            realm.add(training)
        }
    }

    func add(singleValue: SingleValue) {
        try! realm.write {
            realm.add(singleValue)
        }
    }

    func add(value: Value) {
        try! realm.write {
            realm.add(value)
        }
    }

    func add(exercice: Exercice) {
        try! realm.write {
            realm.add(exercice)
        }
    }

    // MARK: - Gets
    func getAllSingleValues() -> [SingleValue] {
        return Array(realm.objects(SingleValue.self))
    }

    func getAllTrainging() -> [Training] {
        return Array(realm.objects(Training.self))
    }

    func getAll() -> [TrainingValue] {
        var values = [TrainingValue]()
        values.append(contentsOf: getAllSingleValues())
        values.append(contentsOf: getAllTrainging())
        return values
    }

    // MARK: - Delete
    func delete(singleValue: SingleValue) {
        try! realm.write {
            realm.delete(singleValue)
        }
    }

    func delete(exercice: Exercice) {
        try! realm.write {
            realm.delete(exercice)
        }
    }
}
