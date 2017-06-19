//
//  UITextFieldExtension.swift
//  BaseMVVM
//
//  Created by Cong on 6/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {
    /// SwifterSwift: Check if text field is empty.
    public var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    /// SwifterSwift: Return text with no spaces or new lines in beginning and end.
    public var trimmedText: String? {
        return text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}
