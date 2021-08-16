//
//  ConsultantCell.swift
//  salamtech
//
//  Created by hesham ghalaab on 5/28/20.
//  Copyright © 2020 hesham ghalaab. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    static let identifier = "UserCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configure(user:Users) {
        self.nameLabel.text = user.name
        self.jobLabel.text = user.jobTitle
    }
}
