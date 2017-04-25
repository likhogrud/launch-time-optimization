//
//  MainPresenter.swift
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation

class MailPresenter {

    class func presentMail() {
        LazyMessageUI.presentMailComposeViewController()
    }
    
}
//
//import MessageUI
//import Foundation
//
//class MailPresenter {
//
//    class func presentMail() {
//        let controller = MFMailComposeViewController()
//        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
//    }
//
//}
