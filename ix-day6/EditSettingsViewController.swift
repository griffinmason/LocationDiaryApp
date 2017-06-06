//
//  EditSettingsViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/6/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class EditSettingsViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(_ sender: UIButton) {
        UserDefaults.standard.set(nameInput.text, forKey: "userName")
    }
    

}
