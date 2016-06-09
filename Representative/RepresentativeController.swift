//
//  RepresentativeController.swift
//  Representative
//
//  Created by Sean Gilhuly on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        
        guard let url = NSURL(string: baseURL) else {
            completion(representatives: [])
            return
        }
        
        let urlParameters = ["state": state, "output": "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
                representativeDictionaries = json ["results"] as? [[String:AnyObject]]
                else {
                    completion(representatives: [])
                    return
            }
            
            let representatives = representativeDictionaries.flatMap({Representative(jsonDictionary: $0)})
            completion(representatives: representatives)
        }
    }
}