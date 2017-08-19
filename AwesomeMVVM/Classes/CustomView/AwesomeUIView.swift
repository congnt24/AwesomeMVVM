//
//  AwesomeUIView.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//


import UIKit

@IBDesignable
open class AwesomeUIView: UIView {
    // MARK: - bottom line
    @IBInspectable var bottomLineWidth: CGFloat = 0 {
        didSet {
            let border = CALayer()
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - bottomLineWidth, width: UIScreen.main.bounds.width, height: frame.size.height)
            border.borderWidth = bottomLineWidth
            layer.addSublayer(border)
            layer.masksToBounds = true
        }
    }
    @IBInspectable var bottomLineColor: UIColor = UIColor.red {
        didSet {
            let border = CALayer()
            border.borderColor = bottomLineColor.cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - bottomLineWidth, width: UIScreen.main.bounds.width, height: frame.size.height)
            border.borderWidth = bottomLineWidth
            layer.addSublayer(border)
            layer.masksToBounds = true
        }
    }
}
