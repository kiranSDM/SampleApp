//
//  PersonNameTableViewCell.swift
//  iOSArchitecture_MVVM
//
//  Created by Kawalpreet Kaur on 01/06/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class PersonNameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var person: User? = nil {
        didSet {
            if let object = person {
                nameLabel.text = object.firstName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
