//
//  RootViewController.swift
//  Original
//
//  Created by Nikolay Lihogrud
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    fileprivate(set) weak var searchFacade: SearchFacade?
    fileprivate(set) weak var routingFacade: RoutingFacade?

    fileprivate let searchButton = UIButton(type: .system)
    fileprivate let routingButton = UIButton(type: .system)

    init(searchFacade: SearchFacade, routingFacade: RoutingFacade) {
        self.searchFacade = searchFacade
        self.routingFacade = routingFacade

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(searchButton)
        searchButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(onSearchButtonTapped), for: .touchUpInside)

        view.addSubview(routingButton)
        routingButton.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        routingButton.setTitle("Route", for: .normal)
        routingButton.addTarget(self, action: #selector(onRoutingButtonTapped), for: .touchUpInside)

    }

    @objc func onSearchButtonTapped() {
        searchFacade?.performSearch()
    }

    @objc func onRoutingButtonTapped() {
        routingFacade?.performRouting()
    }

}

