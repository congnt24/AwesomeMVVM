//
//  UserDefaultsExtension.swift
//  BaseMVVM
//
//  Created by Cong on 6/12/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

public extension UserDefaults {
    public subscript(key: String) -> AnyObject? {
        get {
            return object(forKey: key) as AnyObject?
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
