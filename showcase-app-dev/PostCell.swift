//
//  PostCell.swift
//  showcase-app-dev
//
//  Created by Mike on 6/23/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit
import Alamofire

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var showcaseImg: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func drawRect(rect: CGRect) {
        
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        profileImg.clipsToBounds = true
        
        showcaseImg.clipsToBounds = true
        
    }

    func configureCell(post: Post, img: UIImage?) {
        self.post = post
        
        if let desc = post.postDescription {
            self.descriptionText.text = post.postDescription
            self.likesLbl.text = "\(post.likes)"
            
            if post.imageUrl != nil {
               
                if img != nil {
                    self.showcaseImg.image = img
                } else {
                    request = Alamofire.request(.GET, <#T##URLString: URLStringConvertible##URLStringConvertible#>)
                }
                
            } else {
                self.showcaseImg.hidden = true
            }
        }
    }
}
