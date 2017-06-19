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

    public func bindToViewModel() { }
    public func responseFromViewModel() { }
}
