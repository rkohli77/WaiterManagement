//
//  InsertWaiter.swift
//  StaffManagement
//
//  Created by Ritz on 2018-01-27.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

import Foundation
import CoreData


class InsertWaiter {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func saveWaiterName(nameStr: String) {
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "Waiter", into: appDelegate.managedObjectContext)
//        entity.setValue(nameStr, forKey: "name")
        let entityDesc = NSEntityDescription.entity(forEntityName: "Waiter", in: appDelegate.managedObjectContext)
        let managedObj = NSManagedObject(entity: entityDesc!, insertInto: appDelegate.managedObjectContext)
        managedObj.setValue(nameStr, forKey: "name")
        let restMan = RestaurantManager()
        restMan.currentRestaurant().addStaffObject(managedObj)
        appDelegate.saveContext()
    }
}
