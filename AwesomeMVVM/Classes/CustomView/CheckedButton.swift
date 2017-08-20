//
//  AwesomeButton.swift
//  BaseMVVM
//
//  Created by Cong on 6/13/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

/// Using this in storyboard, you need to set unchecked button in image field of button 
/// and checked button in checkedImage field
@IBDesignable
open class CheckedButton: UIButton {
    public var isChecked = false
    public var normalImage: UIImage!
    @IBInspectable var checkedImage: UIImage? = nil {
        didSet {
            normalImage = image(for: .normal)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //handle aciton here
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CheckedButton.changeState)))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func changeState() {
        if isChecked {
            setImage(normalImage, for: .normal)
        } else {
            setImage(checkedImage, for: .normal)
        }
        isChecked = !isChecked
    }
}
