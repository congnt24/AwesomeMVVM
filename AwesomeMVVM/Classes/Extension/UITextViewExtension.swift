//
//  UITextViewExtension.swift
//  BaseMVVM
//
//  Created by Cong on 6/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public extension UITextView {
    /// SwifterSwift: Clear text.
    public func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    /// SwifterSwift: Scroll to the bottom of text view
    public func scrollToBottom() {
        let range = NSMakeRange((text as NSString).length - 1, 1)
        scrollRangeToVisible(range)
    }
    
    /// SwifterSwift: Scroll to the top of text view
    public func scrollToTop() {
        let range = NSMakeRange(0, 1)
        scrollRangeToVisible(range)
    }
}
