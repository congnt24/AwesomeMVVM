//
//  UIStoryboardExtension.swift
//  BaseMVVM
//
//  Created by Cong on 6/13/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

public extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable { }

public extension UIStoryboard {
    
    //Get main storyboard, we don't need specify the name of main storyboard
    public static var mainStoryboard: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    /// Instantiate a UIViewController using its class name
    /// - Parameter name: UIViewController type
    /// - Returns: The view controller corresponding to specified class name
    public func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: name)) as! T
    }
    
    //To use this method, the identify name of viewcontroller in storyboard must same as viewcontroller name
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
