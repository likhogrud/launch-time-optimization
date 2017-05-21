//
//  Search.swift
//  LazySwift
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation
import UIKit

class RoutingFacadeImpl: RoutingFacade {

    public func performRouting() {
        let alertController = UIAlertController(title: nil, message: "Routing Performed", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }

}
