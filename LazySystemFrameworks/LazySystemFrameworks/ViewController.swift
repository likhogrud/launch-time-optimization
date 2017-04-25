//
//  ViewController.swift
//  LazySystemFrameworks
//
//  Created by Nikolay Lihogrud on 15.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var button = UIButton()
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(ViewController.openSafariViewController(_:)), for: .touchUpInside)

        button = UIButton()
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 210, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(ViewController.openMessageUIViewController(_:)), for: .touchUpInside)

        button = UIButton()
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 320, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(ViewController.openStoreKitViewController(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func openSafariViewController(_ button: UIButton) {
        SafariServicesPresenter.presentSafariServices()
    }

    @objc func openMessageUIViewController(_ button: UIButton) {
        MailPresenter.presentMail()
    }

    @objc func openStoreKitViewController(_ button: UIButton) {
        StoreKitPresenter.presentStoreKit()
    }


}

