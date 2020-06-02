//
//  Constant.swift
//  iOSArchitecture
//
//  Created by Amit Shukla on 05/07/18.
//  Copyright © 2018 smartData. All rights reserved.
//

import Foundation
import UIKit


public struct AlertMessage {
    static let invalidPath      = NSLocalizedString("Invalid filename/path.", comment: "")
    static let parseError       = NSLocalizedString("Parse error:", comment: "")
    static let errorToSave      = NSLocalizedString("Could not save.", comment: "")
    static let errorToFetch     = NSLocalizedString("Could not fetch.", comment: "")
    static let invalidJson      = NSLocalizedString("Invalid Json.", comment: "")
    static let invalidResponse  = NSLocalizedString("Plesae try again later", comment: "")
    static let invalidURL       = "Invalid server url"
    static let lostInternet     = "It seems you are offline, Please check your Internet connection."
    static let invalidEmail     = "Please enter a valid email address"
    static let invalidPassword  = "Please enter a minimum 6 character password"

}
public struct Identifiers{
    
    enum StoryBoard{
        static let main         = "Main"
    }
    enum Controller{
        static let DashboardDetailViewController    = "DashboardDetailViewController"
        static let ForgotPasswordVC     = "ForgotPasswordVC"
        static let SignUpVC             = "SignUpVC"
        static let DashboardVC          = "DashboardVC"
        static let MyProfileVC          = "MyProfileVC"
        static let CaseListingVC        = "CaseListingVC"
        static let AddCaseVC            = "AddCaseVC"
    }
}

public struct Entities{
    static let person = "Person"
}

public struct Macros{
    static let persons = "Persons"
}
