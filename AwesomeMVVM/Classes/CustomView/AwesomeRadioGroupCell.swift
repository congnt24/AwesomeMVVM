//
//  AwesomeRadioGroupCell.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//

import Foundation
import UIKit

open class AwesomeRadioGroupCell: UIButton {
    public var position: Int!
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
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AwesomeRadioGroupCell.groupCheck)))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func check(){
        isChecked = true
        setImage(checkedImage, for: .normal)
    }
    
    func groupCheck() {
        (superview as! AwesomeRadioGroup).checkItem(position: position)
        check()
    }
    
    public func uncheck() {
        isChecked = false
        setImage(normalImage, for: .normal)
    }
    
}
