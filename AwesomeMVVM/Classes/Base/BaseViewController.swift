//
//  BaseViewController.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        responseFromViewModel()
    }
    /// Using to bind data to viewmodel using rxcocoa
    public func bindToViewModel() { }
    /// Subscribe the observable from viewmodel
    public func responseFromViewModel() { }
}
