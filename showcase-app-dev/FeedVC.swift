//
//  FeedVC.swift
//  showcase-app-dev
//
//  Created by Mike on 6/23/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    static var imageCache = NSCache()
    

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
      tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            
            self.posts = []
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDict)
                        self.posts.append(post)
                        }
                    }
                }
            
            self.tableView.reloadData()
            })
        }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
    
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return posts.count
    
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let post = posts[indexPath.row]
    
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            var img: UIImage?
            
            if let url = post.imageUrl {
                img = FeedVC.imageCache.objectForKey(url) as? UIImage
            }
            
            
            cell.configureCell(post, img: img)
            return cell
        }else{
            return PostCell()
        }
    }
}
