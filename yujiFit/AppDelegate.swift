//
//  AppDelegate.swift
//  yujiFit
//
//  Created by jerome cha on 2020/11/15.
//  Copyright © 2020 jerome. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // RealmSwift Migration
        migration()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = YFTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

    private func migration() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldVersion in
                // Pour l'instant rien
            })
        Realm.Configuration.defaultConfiguration = config
    }

}

