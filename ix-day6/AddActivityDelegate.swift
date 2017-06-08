//
//  AddActivityDelegate.swift
//  ix-day6
//
//  Created by George Mason on 6/6/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import Foundation

protocol AddActivityDelegate {
    //func activityWillBeSaved()
    func didSaveActivity(activity: Activity)
    //func didCancelActivity()
}
