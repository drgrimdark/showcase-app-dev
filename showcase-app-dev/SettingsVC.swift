//
//  SettingsVC.swift
//  showcase-app-dev
//
//  Created by Mike on 7/20/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func doneBtnTapped(sender: UIBarButtonItem!) {
        
        performSegueWithIdentifier("doneTapped", sender: "doneBtnTapped:")
    }
}
