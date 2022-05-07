//
//  AppDelegate.swift
//  RCSceneExample
//
//  Created by shaoshuai on 2022/3/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppConfigs.config()

        return true
    }

}

