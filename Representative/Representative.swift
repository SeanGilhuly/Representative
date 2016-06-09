//
//  Representative.swift
//  Representative
//
//  Created by Sean Gilhuly on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(jsonDictionary: [String:AnyObject]) {
        guard let name = jsonDictionary ["name"] as? String,
        party = jsonDictionary ["party"] as? String,
        state = jsonDictionary ["state"] as? String,
        district = jsonDictionary ["district"] as? String,
        phone = jsonDictionary ["phone"] as? String,
        office = jsonDictionary ["office"] as? String,
        link = jsonDictionary ["link"] as? String else {
            return nil
        }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}