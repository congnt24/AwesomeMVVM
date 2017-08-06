//
//  AwesomeTextField.swift
//  iOSToDoApp
//
//  Created by Cong on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

enum DateFormatType: String {
    case DateTime = "yMMMMd hh:mm"
    case Date = "yMMMMd"
    case Time = "hh:mm"
}

@IBDesignable
open class AwesomeTextField: UITextField {
    
//    @IBInspectable var labelOnTop: String = "" {
//        didSet {
//            
//        }
//    }
//    
    // MARK: - Placeholder
    @IBInspectable public var placeHolderColor: UIColor = UIColor.clear {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName: placeHolderColor])
        }
    }
    @IBInspectable public var labelLeftColor: UIColor = UIColor.black
    
    // MARK: - Label left view
    @IBInspectable public var labelLeft: String = "" {
        didSet {
            leftViewMode = .always
            let view = UIView()
            let label = UILabel()
            label.text = labelLeft
            label.font = UIFont.systemFont(ofSize: font!.pointSize)
            label.sizeToFit()
            label.textColor = labelLeftColor
            view.frame = CGRect(x: 5, y: 0, width: label.frame.width, height: self.frame.height)
            var center = label.center
            center.x = view.center.x
            center.y = view.center.y
            label.center = center
            view.addSubview(label)
            leftView = view
            paddingValue.left = view.frame.width + paddingLeft
        }
    }


    // MARK: - padding
    var paddingValue = UIEdgeInsetsMake(0, 5, 0, 5)
    @IBInspectable public var paddingLeft: CGFloat = 5 {
        didSet {
            if let left1Image = leftView {
                paddingValue.left = left1Image.frame.width + paddingLeft
            } else {
                paddingValue.left = paddingLeft
            }
        }
    }

    // MARK: - bottom line
    @IBInspectable public var bottomLineWidth: CGFloat = 0 {
        didSet {
            let border = CALayer()
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - bottomLineWidth, width: frame.size.width, height: frame.size.height)
            border.borderWidth = bottomLineWidth
            layer.addSublayer(border)
            layer.masksToBounds = true
        }
    }

    @IBInspectable public var bottomLineColor: UIColor = UIColor.red {
        didSet {
            let border = CALayer()
            border.borderColor = bottomLineColor.cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - bottomLineWidth, width: frame.size.width, height: frame.size.height)
            border.borderWidth = bottomLineWidth
            layer.addSublayer(border)
            layer.masksToBounds = true
        }
    }

    // MARK: - Icon
    // Make sure this func run before set tint color
    @IBInspectable public var leftImage: UIImage? {
        didSet {
            leftViewMode = .always
            leftView = createImageViewWrapper(value: leftImage!)
            if leftViewTintColor != UIColor.clear {
                let tmp = leftViewTintColor
                leftViewTintColor = tmp
            }
            paddingValue.left = leftView!.frame.width + paddingLeft
        }
    }

    @IBInspectable public var rightImage: UIImage? {
        didSet {
            rightViewMode = .always
            if rightViewTintColor != UIColor.clear {
                let tmp = rightViewTintColor
                rightViewTintColor = tmp
            }
            rightView = createImageViewWrapper(value: rightImage!)
        }
    }

    @IBInspectable
    public var leftViewTintColor: UIColor = UIColor.clear {
        didSet {
            guard let iconView = leftView?.subviews[0] as? UIImageView else {
                return
            }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = leftViewTintColor
        }
    }
    @IBInspectable
    public var rightViewTintColor: UIColor = UIColor.clear {
        didSet {
            guard let iconView = rightView?.subviews[0] as? UIImageView else {
                return
            }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = rightViewTintColor
        }
    }

    public func createImageViewWrapper(value: UIImage) -> UIView {
        let viewWrapper = UIView()
        let image = UIImageView(image: value)
        viewWrapper.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        //make image in center
        var center = image.center
        center.x = viewWrapper.center.x
        center.y = viewWrapper.center.y
        image.center = center
        viewWrapper.addSubview(image)
        //add view and set view
        return viewWrapper
    }


    // MARK: - Datetime
    @IBInspectable public var enableDatePicker: Bool = false {
        didSet {
            setupDatePicker()
        }
    }
    @IBInspectable public var enableTimePicker: Bool = false {
        didSet {
            setupDatePicker()
        }
    }

}

// Function
public extension AwesomeTextField {
    // MARK: - Padding override
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddingValue)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddingValue)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddingValue)
    }
    // MARK: - date time
    fileprivate func setupDatePicker() {
        if enableDatePicker || enableTimePicker {
            let datePicker = UIDatePicker()
            //setup mode
            if enableDatePicker && enableTimePicker {
                datePicker.datePickerMode = .dateAndTime
            } else if enableDatePicker {
                datePicker.datePickerMode = .date
            } else if enableTimePicker {
                datePicker.datePickerMode = .time
            }
            datePicker.addTarget(self, action: #selector(onDateChange(sender:)), for: .valueChanged)
            self.text = formatDate(mode: datePicker.datePickerMode, date: Date())

            self.inputView = datePicker
        }
    }

    public func onDateChange(sender: UIDatePicker) {
        self.text = formatDate(mode: sender.datePickerMode, date: sender.date)
    }


    public func formatDate(mode: UIDatePickerMode, date: Date) -> String {
        let dateFormater = DateFormatter()
        var format: DateFormatType {
            switch mode {
            case .time:
                return .Time
            case .date:
                return .Date
            default:
                return .Date
            }
        }
        dateFormater.setLocalizedDateFormatFromTemplate(format.rawValue)
        return dateFormater.string(from: date)
    }
}
