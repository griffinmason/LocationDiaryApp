//
//  AddActivity.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class AddActivity: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    

    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.didCancelActivity()
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "unwindToVC1", sender: self)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        newActivity?.name = nameField.text!
        newActivity?.description = descriptionField.text
        delegate?.didSaveActivity(activity: newActivity!)
        dismiss(animated: true, completion: nil)
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
