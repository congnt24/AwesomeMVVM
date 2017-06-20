//
//  UISearchBarExtension.swift
//  Pods
//
//  Created by Cong on 6/20/17.
//
//

import UIKit


// MARK: - Properties
public extension UISearchBar {
    
    /// Text field inside search bar (if applicable).
    public var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    
    /// Text with no spaces or new lines in beginning and end (if applicable).
    public var trimmedText: String? {
        return text?.trimmed
    }
    
}


// MARK: - Methods
public extension UISearchBar {
    
    /// Clear text.
    public func clear() {
        text = ""
    }
}
