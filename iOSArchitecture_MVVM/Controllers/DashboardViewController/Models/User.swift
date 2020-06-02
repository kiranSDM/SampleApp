//
//  User.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 01/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import Foundation
import CoreData

public class User {
    public var firstName : String?
    public var lastName : String?
    public var age : String?
    public var birthday : String?
    public var address : String?
    public var mobileNo : String?
    public var contactPerson : String?
    public var contactPersonPhoneNo : String?
    public var email : String?

    public class func modelsFromDictionaryArray(array: Array<NSManagedObject>) -> [User]
    {
        var models:[User] = []
        for item in array
        {
            models.append(User(object: item )!)
        }
        return models
    }

    required public init?(object: NSManagedObject) {
        
        firstName = object.value(forKey: "firstName") as? String ?? ""
        lastName = object.value(forKey: "lastName") as? String ?? ""
        address = object.value(forKey: "address") as? String ?? ""
        email = object.value(forKey: "email") as? String ?? ""
        mobileNo = object.value(forKey: "mobileNo") as? String ?? ""
        birthday = object.value(forKey: "birthday") as? String ?? ""
        contactPerson = object.value(forKey: "contactPerson") as? String ?? ""
        contactPersonPhoneNo = object.value(forKey: "contactPersonPhoneNo") as? String ?? ""
        age = String.getYearFromDateString(inputDate: birthday ?? "", inputFormat: "dd/MM/yyyy")
    }
        
}

