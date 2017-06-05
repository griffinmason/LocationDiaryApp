//
//  AddActivity.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class AddActivity: UIViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwindToVC1", sender: self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwindToVC1", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
