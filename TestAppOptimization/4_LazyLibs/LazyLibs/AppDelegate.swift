//
//  AppDelegate.swift
//  LazyLibs
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if ProcessInfo.processInfo.environment["DYLD_PRINT_STATISTICS"] != nil {
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(3.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
                execute: {
                    exit(0)
            })
        }

        return true
    }

}

