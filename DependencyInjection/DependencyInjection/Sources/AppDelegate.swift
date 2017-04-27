//
//  ApplicationDeps.swift
//  DependencyInjection
//
//  Created by Nikolay Lihogrud on 27.04.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var applicationDeps: ApplicationDeps? = ApplicationDeps()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow()
        window?.rootViewController = applicationDeps?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        applicationDeps = nil
        print(#function)
    }

}

