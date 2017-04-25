//
//  SafariServicesPresenter.swift
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//


import Foundation

class SafariServicesPresenter {

    class func presentSafariServices() {
        LazySafariServices.presentSafariViewController()
    }
}

//
//import Foundation
//import SafariServices
//
//class SafariServicesPresenter {
//
//    class func presentSafariServices() {
//        let safariViewConroller = SFSafariViewController(url: URL(string: "https://yandex.ru")!)
//        UIApplication.shared.keyWindow?.rootViewController?.present(safariViewConroller, animated: true, completion: nil)
//    }
//}
