//
//  DashboardDetailViewController.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 01/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class DashboardDetailViewController: UIViewController {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var contactPerson: UILabel!
    @IBOutlet weak var contactPersonPhoneNumber: UILabel!
    
    //dashboardToDetail
    var person: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        firstName.text = "First Name: " + (person?.firstName ?? "")
        lastName.text = "Last Name: " + (person?.lastName ?? "")
        birthday.text = "Birthday: " + (person?.birthday ?? "")
        age.text = "Age: " + (person?.age ?? "")
        emailAddress.text = "Email: " + (person?.email ?? "")
        mobileNumber.text = "Mobile: " + (person?.mobileNo ?? "")
        address.text = "Address: " + (person?.address ?? "")
        contactPerson.text = "Contact Person: " + (person?.contactPerson ?? "")
        contactPersonPhoneNumber.text = "Contact Person No: " + (person?.contactPersonPhoneNo ?? "")
    }
    
}
