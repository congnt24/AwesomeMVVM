//
//  RadioGroupCell.swift
//  BaseMVVM
//
//  Created by Cong on 6/14/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

open class RadioGroupCell: UIButton {
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
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RadioGroupCell.groupCheck)))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func check(){
        isChecked = true
        setImage(checkedImage, for: .normal)
    }
    
    func groupCheck() {
        (superview as! RadioGroup).checkItem(position: position)
        check()
    }
    
    public func uncheck() {
        isChecked = false
        setImage(normalImage, for: .normal)
    }

}
