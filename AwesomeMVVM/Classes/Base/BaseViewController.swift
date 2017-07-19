//
//  BaseViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
open class BaseViewController: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        responseFromViewModel()
    }
    /// Using to bind data to viewmodel using rxcocoa
    open func bindToViewModel() { }
    /// Subscribe the observable from viewmodel
    open func responseFromViewModel() { }
}
