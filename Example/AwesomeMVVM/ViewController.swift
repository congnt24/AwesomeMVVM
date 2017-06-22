//
//  ViewController.swift
//  AwesomeMVVM
//
//  Created by congnt24 on 06/19/2017.
//  Copyright (c) 2017 congnt24. All rights reserved.
//

import Foundation
import UIKit
import AwesomeMVVM
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loading = UINib(nibName: "LoadingIndicator", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIActivityIndicatorView
        
        LoadingOverlay.shared.setCustomIndicator(view: loading, startAnimation: {
            loading.startAnimating()
        }, stopAnimation: {
            loading.stopAnimating()
        })
        
        LoadingOverlay.shared.showOverlay(view: view, delayToHideInMillis: 2000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
