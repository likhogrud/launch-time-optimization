//
//  ApplicationDeps.swift
//  DependencyInjection
//
//  Created by Nikolay Lihogrud on 27.04.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import Foundation
import UIKit

class ApplicationDeps: RootViewController.Deps, RoutingFacadeImpl.Deps, SearchFacadeImpl.Deps {

    deinit {
        #if DEBUG
            print(NSStringFromClass(type(of: self)) + " DEALLOC")
        #endif
    }

    fileprivate var depsCreationDepth = 0

    fileprivate func trackCreation<T>(_ creator: () -> T ) -> T {

        let className = "\(T.self)"

        var printOffset = "DEPS:    "
        if depsCreationDepth > 0 {
            printOffset += (0..<(depsCreationDepth)).map { depth in  "    " }.reduce("", +)
        }

        print(printOffset + className + " CREATED")

        depsCreationDepth += 1
        let res = creator()
        depsCreationDepth -= 1

        return res
    }

    lazy var rootViewController: RootViewController = { return self.trackCreation {
        return RootViewController(deps: self.weakWrapper)
    }}()

    lazy var searchFacade: SearchFacade = { return self.trackCreation {
        return SearchFacadeImpl(deps: self.weakWrapper)
    }}()

    lazy var routingFacade: RoutingFacade = { return self.trackCreation {
        return RoutingFacadeImpl(deps: self.weakWrapper)
    }}()

    var topViewController: UIViewController { return rootViewController }

    fileprivate var weakWrapper: ApplicationDepsWeakWrapper { return ApplicationDepsWeakWrapper(instance: self) }
}


fileprivate class ApplicationDepsWeakWrapper: RootViewController.Deps, RoutingFacadeImpl.Deps, SearchFacadeImpl.Deps {

    weak var instance: ApplicationDeps!

    init(instance: ApplicationDeps){
        self.instance = instance
    }

    var searchFacade: SearchFacade { return instance!.searchFacade }
    var routingFacade: RoutingFacade { return instance!.routingFacade }
    var topViewController: UIViewController { return instance!.rootViewController }

}
