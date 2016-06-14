//
//  DataService.swift
//  showcase-app-dev
//
//  Created by Mike on 6/14/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import Foundation
import Firebase

class DataService {
  static let ds = DataService()
  
  private var _REF_BASE = Firebase(url: "littlelujan-showcase.firebaseapp.com")
  
  var REF_BASE: Firebase {
    return _REF_BASE
  }
    
  
}