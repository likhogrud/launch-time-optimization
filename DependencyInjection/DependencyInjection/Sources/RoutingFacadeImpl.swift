//
//  RoutingFacadeImpl.swift
//  DependencyInjection
//
//  Created by Nikolay Lihogrud on 27.04.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation
import UIKit

protocol RoutingFacadeImplDeps {
    var topViewController: UIViewController { get }
}

class RoutingFacadeImpl: RoutingFacade {

    typealias Deps = RoutingFacadeImplDeps

    init(deps: Deps) {
        self.deps = deps
    }

    deinit {
        #if DEBUG
            print(NSStringFromClass(type(of: self)) + " DEALLOC")
        #endif
    }

    func performRouting() {
        let alertController = UIAlertController(title: nil, message: "Routing Performed", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        deps.topViewController.present(alertController, animated: true, completion: nil)
    }

    fileprivate let deps: Deps
}
