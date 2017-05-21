//
//  AppDelegate.swift
//  Original
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    let searchFacade: SearchFacade = SearchFacadeImpl()
    let routingFacade: RoutingFacade = RoutingFacadeImpl()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow()
        window?.rootViewController = RootViewController(searchFacade: searchFacade, routingFacade: routingFacade)
        window?.makeKeyAndVisible()
        
        return true
    }
}

