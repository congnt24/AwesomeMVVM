//
//  BaseCustomView.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//


import UIKit

open class BaseCustomView: UIView {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    open func setupNormalView(nibName: String){
        let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = self.bounds
    }
    open func setupView(nibName: String){
        let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = self.bounds
        // add constraint
        // Get the superview's layout
        let margins = self.layoutMarginsGuide
        // Pin the leading edge of myView to the margin's leading edge
        view.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        // Pin the trailing edge of myView to the margin's trailing edge
        view.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}
