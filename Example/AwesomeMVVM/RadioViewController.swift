//
//  RadioViewController.swift
//  AwesomeMVVM
//
//  Created by Cong on 6/22/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AwesomeMVVM

class RadioViewController: UIViewController {

    @IBOutlet weak var radioGroup: RadioGroup!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        radioGroup.checkAt(position: 0)
        radioGroup.onValueChange = {print($0)}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
