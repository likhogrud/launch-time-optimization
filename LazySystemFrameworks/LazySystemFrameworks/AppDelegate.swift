//
//  AppDelegate.swift
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white

        if ProcessInfo.processInfo.environment["DYLD_PRINT_STATISTICS"] != nil {
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
                execute: {
                    exit(0)
            })
        }

        return true
    }

}

