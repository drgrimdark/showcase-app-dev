//
//  DataService.swift
//  showcase-app-dev
//
//  Created by Mike on 6/14/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://littlelujan-showcase.firebaseIO.com"

class DataService {
    static let ds = DataService()
  
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_POSTS = Firebase(url: "\(URL_BASE)/posts")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
  
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
  
}