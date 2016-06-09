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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RepresentativeController.searchRepsByState(state) { (representative) in
            self.stateRepresentatives
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                tableView.reloadData()
            })
        }
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath)

        // Configure the cell...
        

        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
