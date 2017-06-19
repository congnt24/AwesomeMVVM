//
//  AwesomeButton.swift
//  BaseMVVM
//
//  Created by Cong on 6/13/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public class CheckedButton: UIButton {
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
