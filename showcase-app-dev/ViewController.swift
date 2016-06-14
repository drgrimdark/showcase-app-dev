//
//  ViewController.swift
//  showcase-app-dev
//
//  Created by Mike on 6/6/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
  
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

   override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil{
      self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
    }
  }
  
  @IBAction func fbBtnPressed(sender: UIButton!){
    let facebookLogin = FBSDKLoginManager()
    
    facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError:  NSError!) -> Void in
      if facebookError != nil{
        print("Facebook login failed. Error \(facebookError)")
      } else {
        let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
        print("Successfully logged into facebook \(accessToken)")
        
        DataService.ds.REF_BASE.authWithOAuthProvider( "facebook" , token: accessToken, withCompletionBlock: { error, authData in
          
          if error != nil {
            print("login Failed")
          } else {
            print("Login Success! \(authData)")
            NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
            
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
          }
          
        })
        
        
      }
    }
  }

}

