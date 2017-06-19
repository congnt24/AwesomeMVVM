//
//  RadioGroupCell.swift
//  BaseMVVM
//
//  Created by Cong on 6/14/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public class RadioGroupCell: UIButton {
    var position: Int!
    var isChecked = false
    var normalImage: UIImage!
    @IBInspectable var checkedImage: UIImage? = nil {
        didSet {
            normalImage = image(for: .normal)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //handle aciton here
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RadioGroupCell.check)))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func check() {
        (superview as! RadioGroup).checkItem(position: position)
        print(position)
        isChecked = true
        setImage(checkedImage, for: .normal)
    }
    
    public func uncheck() {
        isChecked = true
        setImage(normalImage, for: .normal)
    }

}
