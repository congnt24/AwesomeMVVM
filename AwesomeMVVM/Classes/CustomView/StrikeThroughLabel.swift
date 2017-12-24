//
//  StrikeThroughLabel.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//

import UIKit

@IBDesignable
class StrikeThroughLabel: UILabel {
    override func awakeFromNib() {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text!)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        attributedText = attributeString
    }
    public func setText(str: String){
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: str)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        attributedText = attributeString
    }
}
