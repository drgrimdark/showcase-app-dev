//
//  FeedVC.swift
//  showcase-app-dev
//
//  Created by Mike on 6/23/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
      tableView.dataSource = self
    }
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 3
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
  }


}
