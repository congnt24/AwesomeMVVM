//
//  RadioGroup.swift
//  BaseMVVM
//
//  Created by Cong on 6/14/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public class RadioGroup: UIStackView {
    @IBInspectable var stringData: String = ""

    var checkedPosition = 0
    var cell: RadioGroupCell!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func awakeFromNib() {
        setupRadioButton(ofArray: stringData.components(separatedBy: ";"))
    }

    public func setupRadioButton(ofArray: [String]) {
        cell = subviews[0] as! RadioGroupCell
        removeSubviews()
        var index = 0
        for item in ofArray {
            let btn = cell.copyView() as! RadioGroupCell
            btn.position = index
            index += 1
            btn.checkedImage = cell.checkedImage
            btn.setTitle(item, for: .normal)
            addArrangedSubview(btn)
        }
    }
    
    public func checkItem(position: Int) {
        uncheckAll()
        checkedPosition = position
    }
    
    private func uncheckAll(){
        for btn in subviews {
            (btn as! RadioGroupCell).uncheck()
        }
    }
}
