//
//  Coordinator.swift
//  iOSToDoApp
//
//  Created by Cong on 6/4/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit
/**
 A base coordinator class with some basic special variable for navigating between screens.
 Each flow, you need to create a concrete of Coordinator to handle the transition of flow
 Ex: Sign in, sign up and forget password screen: we create a LoginCoordinator for this flow
 */
public class Coordinator {
    //just a map to save viewcontroller, useful when you need to pop to specific screen
    var coordinators = [String: Any]()
    // navigation controller to push and pop view controller
    var navigation: UINavigationController?
    //sometime you need to change root viewcontroller
    var window: UIWindow?
    //must init storyboard in AppDelegate
    var mainStoryboard: UIStoryboard = UIStoryboard.mainStoryboard!

    init(_ navigation: UINavigationController?, _ window: UIWindow? = nil) {
        self.window = window
        self.navigation = navigation
    }
    
    //a function to initialize viewcontroller and viewmodel
    public func start(_ data: Any? = nil) {
        
    }
}
