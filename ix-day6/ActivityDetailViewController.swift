//
//  ActivityDetailViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/7/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    var activity: Activity?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    var lat: String?
    var long: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = activity?.name
        descriptionLabel.text = activity?.description
        lat = ("Latitude: \(String(describing: activity?.location.lat))")
        latLabel.text = lat
        long = ("Longitude: \(String(describing: activity?.location.lng))")
        longLabel.text = long
        
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
