//
//  AwesomeSwitch.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//

import UIKit

@IBDesignable
class AwesomeSwitch: UISwitch {
    
    @IBInspectable var scaleX: CGFloat = 1.0
    @IBInspectable var scaleY: CGFloat = 1.0
    
    override func awakeFromNib() {
        transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
    }
    
}
