//
//  SecondViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    var activities: [Activity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = activities[indexPath.item].name
        cell.detailTextLabel?.text = activities[indexPath.item].description
        
        return cell
    }

}

