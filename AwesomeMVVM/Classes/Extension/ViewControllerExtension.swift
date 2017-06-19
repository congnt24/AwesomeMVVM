//
//  ViewControllerExtension.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    typealias completion = ((String)->Void)?
    
    public func showMessageDialog(_ title: String, _ message: String) {
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        dialog.addAction(ok)
        present(dialog, animated: true, completion: nil)
        
    }
    
    public func showInputDialog(_ title: String, defaultText: String? = nil, label: UILabel?, onCompletion: completion){
        let dialog = UIAlertController(title: "\(title)", message: "Please enter \(title)", preferredStyle: .alert)
        dialog.addTextField { (textField) in
            textField.placeholder = "\(title)"
            if defaultText != nil {
                textField.text = defaultText
            }
        }
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            label?.text = dialog.textFields?[0].text
            onCompletion?((label?.text)!)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        dialog.addAction(ok)
        dialog.addAction(cancel)
        present(dialog, animated: true, completion: nil)
    }

}
