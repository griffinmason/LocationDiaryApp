//
//  SecondViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/5/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController, AddActivityDelegate {
    
    var activities: [Activity] = []
    var currentlySelectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let activity1 = Activity()
        activity1!.name = "First Activity"
        activity1!.description = "First Activity Description"
        let activity2 = Activity()
        activity2!.name = "Second Activity"
        activity2!.description = "Second Activity Description"
        activities.append(activity1!)
        activities.append(activity2!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        
    }
 */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToActivityDetail" {
            let activityVC = segue.destination as! ActivityDetailViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            activityVC.activity = activities[(indexPath?.row)!]
        }
        if segue.identifier == "navToAddActivity" {
            let navigationViewController = segue.destination as! UINavigationController
            let addActivityViewController = navigationViewController.topViewController as! AddActivity
            
            addActivityViewController.delegate = self
        }
    }
    
    func didSaveActivity(activity: Activity) {
        print("Activity was saved: \(activity)")
        activities.append(activity)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentlySelectedIndexPath = indexPath
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = activities[indexPath.item].name
        cell.detailTextLabel?.text = activities[indexPath.item].description
        
        return cell
    }

}

