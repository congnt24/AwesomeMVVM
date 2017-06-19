//
//  UserDefaultHandler.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation

/**
 This class handle general preference for better use
 */
class UserDefaultHandler {
    class var isFirstTime: Bool {
        get {
            return UserDefaults.standard.bool(forKey: AppConstant.FIRST_TIME_KEY)
        }
        
        set(value){
            UserDefaults.standard.set(value, forKey: AppConstant.FIRST_TIME_KEY)
            UserDefaults.standard.synchronize()
        }
    }
    class var isLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: AppConstant.LOGGED_KEY)
        }
        set(logged){
            UserDefaults.standard.set(logged, forKey: AppConstant.LOGGED_KEY)
            UserDefaults.standard.synchronize()
        }
    }
}
