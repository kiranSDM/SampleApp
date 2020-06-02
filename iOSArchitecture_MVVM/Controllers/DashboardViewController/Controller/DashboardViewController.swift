//
//  DashboardViewController.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 01/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit
import CoreData

class DashboardViewController: BaseViewController {

    @IBOutlet weak var personsTableView: UITableView!
    
    lazy var viewModel: DashboardViewModel = {
        let obj = DashboardViewModel()
        self.baseVwModel = obj
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        navigationItem.title = Macros.persons
        personsTableView.tableFooterView = UIView()
        self.setUpClosure()
    }
    
    func setUpClosure() {
        viewModel.reloadListViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.personsTableView?.reloadData()
            }
        }
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = personsTableView.dequeueReusableCell(withIdentifier: PersonNameTableViewCell.className, for: indexPath) as! PersonNameTableViewCell
        cell.person = viewModel.roomForIndexPath(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let controller = UIStoryboard(name: Identifiers.StoryBoard.main, bundle: nil).instantiateViewController(withIdentifier: Identifiers.Controller.DashboardDetailViewController) as? DashboardDetailViewController {
            controller.person = viewModel.roomForIndexPath(indexPath)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForIndexPath(indexPath)
    }
    
}


