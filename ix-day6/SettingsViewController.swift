//
//  SettingsViewController.swift
//  ix-day6
//
//  Created by George Mason on 6/6/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit
import MapKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.string(forKey: "userName") == nil {
            UserDefaults.standard.set("Name" ,forKey: "userName")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = UserDefaults.standard.string(forKey: "userName")
    }
    
    
    //Function override for visuals on the table view
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let mapType = UserDefaults.standard.string(forKey: "mapType")
        
        if indexPath.section == 2 && mapType == nil {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 0 && mapType == "regular" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 1 && mapType == "transit" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 2 && mapType == "satelite" {
            cell.accessoryType = .checkmark
        }
        
    }
    
    //Function override for effects of touching table cells
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Some navigation Items
        if indexPath.section == 1 && indexPath.row == 0 {
            self.tabBarController?.selectedIndex = 0
        }
        
        if indexPath.section == 1 && indexPath.row == 1 {
            self.tabBarController?.selectedIndex = 1
        }
        
        // Settings
        if indexPath.section ==  2{
            
            // First de-select all
            tableView.cellForRow(at: IndexPath(row: 0, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 1, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 2, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 3, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 4, section: 2))?.accessoryType = .none
            
            // Determine which cell was chosen
            if let cell = tableView.cellForRow(at: indexPath) {
                if indexPath.row == 0 {
                    UserDefaults.standard.set("hybrid", forKey: "mapType")
                }
                
                if indexPath.row == 1 {
                    UserDefaults.standard.set("hybridFlyover", forKey: "mapType")
                }
                
                if indexPath.row == 2 {
                    UserDefaults.standard.set("satelite", forKey: "mapType")
                }
                
                if indexPath.row == 3 {
                    UserDefaults.standard.set("sateliteFlyover", forKey: "mapType")
                }
                
                if indexPath.row == 4 {
                    UserDefaults.standard.set("standard", forKey: "mapType")
                }
                
                cell.accessoryType = .checkmark
            }
        }
    }

}
