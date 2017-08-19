//
//  AwesomeRadioGroup.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//
import UIKit

/// Using this class as UIStackView
/// We need to set distribution field to "fill equally"
/// To set sample data, we set string for stringData field, each item separate by a semicolon ';'
public class AwesomeRadioGroup: UIStackView {
    @IBInspectable var stringData: String = ""
    public var onValueChange: ((Int) -> Void)?
    
    var checkedPosition = 0 {
        didSet {
            if onValueChange != nil {
                onValueChange!(checkedPosition)
            }
        }
    }
    var cell: AwesomeRadioGroupCell!
    
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
        cell = subviews[0] as! AwesomeRadioGroupCell
        removeSubviews()
        var index = 0
        for item in ofArray {
            let btn = cell.copyView() as! AwesomeRadioGroupCell
            btn.position = index
            index += 1
            btn.checkedImage = cell.checkedImage
            btn.setTitle(item, for: .normal)
            btn.titleLabel?.font = cell.titleLabel?.font
            addArrangedSubview(btn)
        }
        checkAt(position: checkedPosition)
    }
    
    public func checkAt(position: Int){
        checkedPosition = position
        uncheckAll()
        (subviews[position] as! AwesomeRadioGroupCell).check()
    }
    
    func checkItem(position: Int) {
        uncheckAll()
        checkedPosition = position
    }
    
    private func uncheckAll() {
        for btn in subviews {
            (btn as! AwesomeRadioGroupCell).uncheck()
        }
    }
}

extension UIView {
    
    ///EZSE: Loops until it finds the top root view. //TODO: Add to readme
    func rootView() -> UIView {
        guard let parentView = superview else {
            return self
        }
        return parentView.rootView()
    }
    
    func copyView() -> UIView?
    {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as? UIView
    }
    
}
