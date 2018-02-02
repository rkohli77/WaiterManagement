//
//  InsertWaiter.swift
//  StaffManagement
//
//  Created by Ritz on 2018-01-27.
//  Copyright © 2018 Derek Harasen. All rights reserved.
//

import Foundation
import CoreData


class InsertWaiter: NSObject {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let fetchRequest = NSFetchRequest<Waiter>(entityName: "Waiter")
    
    
    func saveWaiterName(nameStr: String) {
        if (nameStr.count != 0){
            let entityDesc = NSEntityDescription.entity(forEntityName: "Waiter", in: appDelegate.managedObjectContext)
            let managedObj = NSManagedObject(entity: entityDesc!, insertInto: appDelegate.managedObjectContext)
            managedObj.setValue(nameStr, forKey: "name")
            let restMan = RestaurantManager()
            restMan.currentRestaurant().addStaffObject(managedObj)
            appDelegate.saveContext()
        }
    }
    
    func saveWaiterShift(nameStr: String, startDate: String, endDate: String)  {
        print(nameStr)
       
        do{
            let predicate = NSPredicate(format: "name == %@", nameStr)
            fetchRequest.predicate = predicate
            fetchRequest.resultType = .managedObjectResultType
            fetchRequest.returnsObjectsAsFaults = false
            //let waiter = try appDelegate.managedObjectContext.execute(fetchRequest)
           // let waiter = try appDelegate.persistentStoreCoordinator.execute(fetchRequest, with: appDelegate.managedObjectContext) as! Waiter
            let waiter = try appDelegate.managedObjectContext.fetch(fetchRequest)
            //entity.setValue(waiter, forKey: "waiter")
            let entity = NSEntityDescription.insertNewObject(forEntityName: "Shift", into: appDelegate.managedObjectContext)
           // entity.setValue(waiter, forKey: "shifts")
            entity.setValue(startDate, forKey: "startTime")
            entity.setValue(endDate, forKey: "endTime")
            //appDelegate.saveContext()
            //entity.setValue(waiter[0], forKey: "waiter")
            //waiter[0].addShiftObject(entity)
            
            

        }
        catch {
            print(error.localizedDescription)
        }
        
        appDelegate.saveContext()
    }
    
    func getShifts() -> Array<String> {
            var finalArray = Array<String>()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shift")
            fetchRequest.resultType = .dictionaryResultType
            fetchRequest.returnsObjectsAsFaults = false
            do{
                
                let results = try appDelegate.managedObjectContext.fetch(fetchRequest) as Array<Any>.ArrayLiteralElement
                let resultsDict = results as! [NSDictionary]
                for result in resultsDict {
                    let str = result.value(forKey: "startTime") as! String
                    let str1 = result.value(forKey: "endTime") as! String
                    let finalStr = str + " - " + str1 as String
                    finalArray.append(finalStr)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
            return finalArray
    }
}
