//
//  ViewController.swift
//  StaticPods
//
//  Created by Nikolay Lihogrud on 19.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit
import ObjectMapper
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let json = "{\"key\": \"value\"}"
        let obj = SomeObject(JSONString: json)!
        print(obj.toJSONString()!)

        GMSServices.provideAPIKey("asdf")

        let mapView = GMSMapView(frame: view.bounds)
        view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class SomeObject: Mappable {

    var key: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        key <- map["key"]
    }

}
