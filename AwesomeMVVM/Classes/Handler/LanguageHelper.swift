//
//  LanguageHelper.swift
//  GithubDemo
//
//  Created by apple on 5/29/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

/**
 Handle localizing string for different languages
 */
public class LanguageHelper {
    public class func currentLanguage() -> String? {
        return UserDefaults.standard.string(forKey: AppConstant.LANGUAGE_KEY)
    }
    public class func setLanguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set(lang, forKey: AppConstant.LANGUAGE_KEY)
        userdef.synchronize()
    }
}

public extension String {
    public func localized() -> String {
        let currentLanguage = LanguageHelper.currentLanguage()
        let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj")
        if let path = path, let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }
        return self
    }
}
