//
//  UINavigationExtension.swift
//  BaseMVVM
//
//  Created by Cong on 6/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {
    
    /// SwifterSwift: Pop ViewController with completion handler.
    ///
    /// - Parameter completion: optional completion handler (default is nil).
    public func popViewController(_ completion: (()->Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: true)
        CATransaction.commit()
    }
    
    /// SwifterSwift: Push ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - viewController: viewController to push.
    ///   - completion: optional completion handler (default is nil).
    public func pushViewController(_ viewController: UIViewController, completion: (()->Void)? = nil)  {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
    
    /// SwifterSwift: Make navigation controller's navigation bar transparent.
    ///
    /// - Parameter tint: tint color (default is .white).
    public func makeTransparent(withTint tint: UIColor = .white) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: tint]
    }
}
