//
//  SearchFacadeImpl.swift
//  DependencyInjection
//
//  Created by Nikolay Lihogrud on 27.04.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation
import UIKit

protocol SearchFacadeImplDeps {
    var topViewController: UIViewController { get }
}

class SearchFacadeImpl: SearchFacade {

    typealias Deps = SearchFacadeImplDeps

    init(deps: Deps) {
        self.deps = deps
    }

    deinit {
        #if DEBUG
            print(NSStringFromClass(type(of: self)) + " DEALLOC")
        #endif
    }

    func performSearch() {
        let alertController = UIAlertController(title: nil, message: "Search Performed", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        deps.topViewController.present(alertController, animated: true, completion: nil)
    }

    fileprivate let deps: Deps

}
