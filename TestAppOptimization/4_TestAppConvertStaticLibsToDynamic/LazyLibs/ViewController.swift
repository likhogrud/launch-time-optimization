//
//  ViewController.swift
//  OriginalApp
//
//  Created by Nikolay Lihogrud on 23.03.17.
//  Copyright © 2017 Yandex LLC. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        startSpeechRecognition()
        presentMap()
    }

    public func handleDirectionsRequest(_ request: MKWDirectionsRequest) {
        //...
    }

    public func presentMap() {
        let mapView = YMKLMapView()
        //...
    }

    public func startSpeechRecognition() {
        let session = AVWAudioSession.sharedInstance()!
        try? session.setCategory(AVWAudioSessionCategoryRecord)
        let recognizer = YSKLRecognizer(language: LazySpeechKit.yskRecognitionLanguageRussian(), model: LazySpeechKit.yskRecognitionModelMaps())
        //...
    }
    
}

