//
//  DashboardViewModel.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 01/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DashboardViewModel: BaseViewModel {
    
    private var arrPerson: [User] = [User]() {
        didSet {
            self.reloadListViewClosure?()
        }
    }
    
    override init() {
        super.init()
        getData()
    }
    
    func getData() {
        let receivedData = CoreDataService.fetchData()
        if let receivedUsers = receivedData as? [User]{
            arrPerson = receivedUsers
        } else {
            alertMessage = receivedData as? String ?? AlertMessage.invalidResponse
        }
    }
    
    open func numberOfRow(_ section: Int) -> Int {
        return self.arrPerson.count
    }
    
    open func roomForIndexPath(_ indexPath: IndexPath) -> User {
        return self.arrPerson[indexPath.row]
    }
    
    open func heightForIndexPath(_ indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

