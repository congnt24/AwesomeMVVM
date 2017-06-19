//
//  LoadMoreTableViewCell.swift
//  BaseMVVM
//
//  Created by Cong on 6/15/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

public class LoadMoreTableViewCell: UITableViewCell {
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override public func awakeFromNib() {
        super.awakeFromNib()
        indicator.startAnimating()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
