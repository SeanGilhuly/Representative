//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Sean Gilhuly on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            
            RepresentativeController.searchRepsByState(state, completion: { (representatives) in
                self.representatives = representatives
                self.tableView.reloadData()
            })
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as? CustomStateDetailTableViewCell ?? CustomStateDetailTableViewCell()
        
        let representative = representatives[indexPath.row]
        
        cell.updateWithRepresentative(representative)
        
        return cell
    }
}
