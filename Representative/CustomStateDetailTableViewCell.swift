//
//  CustomStateDetailTableViewCell.swift
//  Representative
//
//  Created by Sean Gilhuly on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class CustomStateDetailTableViewCell: UITableViewCell {
    
    //MARK: - Property
    
    var representative: [Representative] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Function
    
    func updateWithRepresentative(representative: Representative) {
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        websiteLabel.text = representative.phone
    }
    

}
