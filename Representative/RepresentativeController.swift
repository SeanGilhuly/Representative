//
//  RepresentativeController.swift
//  Representative
//
//  Created by Sean Gilhuly on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = "http://whoismyrepresentative.com"
    
    
    static func searchURLForState(state: String) -> NSURL {
        return NSURL(string: baseURL + "/getall_reps_bystate.php?state=\(state)&output=json")!
    }
    
    
    static func searchRepsByState(state: String, completion: (representative: [Representative]) -> Void) {
        
        let url = searchURLForState(state)
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data,
                json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
                representativeDictionaries = json ["results"] as? [[String:AnyObject]]
                else {
                    completion(representative: [])
                    return
            }
            
            let representatives = representativeDictionaries.flatMap({Representative(jsonDictionary: $0)})
            completion(representative: representatives)
        }
    }
}