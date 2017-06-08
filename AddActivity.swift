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
    
    var activityTableViewController: SecondViewController?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBAction func cancel(_ sender: Any?) {
        print("Name: \(String(describing: nameTextField.text))")
        print("Description: \(descriptionTextField.text)")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any?) {
        if (nameTextField.text?.isEmpty)! {
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            let alertController = UIAlertController(title: "Error", message: "Please enter text", preferredStyle: .alert)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)

        }
        else {
            let newActivity = Activity()
            newActivity?.name = nameTextField.text!
            newActivity?.description = descriptionTextField.text!
            //activityTableViewController?.didSaveActivity(activity: newActivity!)
            delegate?.didSaveActivity(activity: newActivity!)
            self.dismiss(animated: true, completion: nil)
        }
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
