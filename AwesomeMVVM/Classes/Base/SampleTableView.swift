//
//  SampleTableView.swift
//  Pods
//
//  Created by Cong Nguyen on 8/19/17.
//
//

import UIKit

@IBDesignable
class SampleTableView: UITableView {
    
    @IBInspectable var nibName: String?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    override func awakeFromNib() {
        if let nibName = nibName {
            self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        }
        
        self.estimatedRowHeight = 96 // some constant value
        self.rowHeight = 96
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        return self.dequeueReusableCell(withIdentifier: nibName!)
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return 10
    }
    
}
