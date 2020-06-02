//
//  CoreDataService.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 02/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit
import CoreData


public class CoreDataService{
    
    public class func fetchData()-> Any {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ""
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Entities.person)
        do {
            let arrPerson = try managedContext.fetch(fetchRequest)
            if !arrPerson.isEmpty {
                return User.modelsFromDictionaryArray(array: arrPerson) // fetch Data from local storage
            } else{
                return fetchRemoteData(managedContext: managedContext) // fetch Data from remote
            }
        } catch let error as NSError {
            return "\(AlertMessage.errorToFetch) \(error), \(error.userInfo)"
        }
    }
    
    public class func fetchRemoteData(managedContext: NSManagedObjectContext)-> Any {
        let entity = NSEntityDescription.entity(forEntityName: Entities.person,in: managedContext)!
        
        if let arrPerson = getJsonData(entity:entity,managedContext:managedContext) as? [Dictionary<String,Any>] {
            // Save all the objects
            for person in arrPerson {
                let personObj = NSManagedObject(entity: entity,insertInto: managedContext)
                for dict in person {
                    personObj.setValue(dict.value, forKey: dict.key)
                }
            }
        } else {
            return AlertMessage.invalidResponse
        }
        do {
            try managedContext.save()
            return self.fetchData()
        } catch let error as NSError {
            return "\(AlertMessage.errorToSave) \(error), \(error.userInfo)"
        }
    }

    public class func getJsonData(entity:NSEntityDescription,managedContext: NSManagedObjectContext)-> Any{
        //Fetch data stored in Data.Json file
        if let path = Bundle.main.path(forResource: "Data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String,Any>,let arrPerson = json["person"] as? Array<Dictionary<String,Any>> {
                    return arrPerson
                } else {
                    return AlertMessage.invalidJson
                }
            } catch let error {
                return "\(AlertMessage.parseError) \(error.localizedDescription)"
            }
        } else {
            return AlertMessage.invalidPath
        }
    }
}
