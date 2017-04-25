//
//  StoreKitPresenter.swift
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation

class StoreKitPresenter {

    class func presentStoreKit() {
        LazyStoreKit.presentViewController()
    }

}

//
//import StoreKit
//import Foundation
//
//class StoreKitPresenter {
//
//    class func presentStoreKit() {
//        let controller = SKStoreProductViewController()
//        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
//    }
//    
//}
//
//
