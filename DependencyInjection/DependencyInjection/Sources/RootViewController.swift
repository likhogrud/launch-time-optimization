//
//  ApplicationDeps.swift
//  DependencyInjection
//
//  Created by Nikolay Lihogrud on 27.04.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

protocol RootViewControllerDeps {
    var searchFacade: SearchFacade { get }
    var routingFacade: RoutingFacade { get }
}

class RootViewController: UIViewController {

    typealias Deps = RootViewControllerDeps

    // MARK: - constructor and desctructor

    init(deps: Deps) {
        self.deps = deps
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        #if DEBUG
            print(NSStringFromClass(type(of: self)) + " DEALLOC")
        #endif
    }

    // MARK: - Overriding

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(RootViewController.search(_:)), for: .touchUpInside)

        searchButton.setTitle("Search", for: .normal)
        searchButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)

        view.backgroundColor = UIColor.white
        view.addSubview(routeButton)
        routeButton.addTarget(self, action: #selector(RootViewController.route(_:)), for: .touchUpInside)
        routeButton.setTitle("Route", for: .normal)
        routeButton.frame = CGRect(x: 100, y: 250, width: 100, height: 100)


    }

    // MARK: - Private properties

    fileprivate let deps: Deps
    fileprivate let searchButton = UIButton(type: .system)
    fileprivate let routeButton = UIButton(type: .system)

}

fileprivate extension RootViewController {

    @objc fileprivate func search(_ button: UIButton) {
        deps.searchFacade.performSearch()
    }

    @objc fileprivate func route(_ button: UIButton) {
        deps.routingFacade.performRouting()
    }

}

