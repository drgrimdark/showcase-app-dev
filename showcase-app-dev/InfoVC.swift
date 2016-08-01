//
//  InfoVC.swift
//  showcase-app-dev
//
//  Created by Mike on 7/25/16.
//  Copyright © 2016 Little Lujan LLC. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class InfoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameField: MaterialTextField!
    @IBOutlet weak var displayImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker = UIImagePickerController()
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func makeUserImg(sender: AnyObject) {
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            if usernameField.text != ""{
                if let img = displayImage.image where imageSelected == true {
                    let urlStr = "https://post.imageshack.us/upload_api.php"
                    let url = NSURL(string: urlStr)!
                    let imgData = UIImageJPEGRepresentation(img, 0.2)!
                    let keyData = "12DJKPSU5fc3afbd01b1630cc718cae3043220f3".dataUsingEncoding(NSUTF8StringEncoding)!
                    let keyJSON = "json".dataUsingEncoding(NSUTF8StringEncoding)!
                    
                    Alamofire.upload(.POST, url, multipartFormData: { multipartFormData in
                        
                        multipartFormData.appendBodyPart(data: imgData, name:"fileupload", fileName:"image", mimeType: "image/jpg")
                        multipartFormData.appendBodyPart(data: keyData, name: "key")
                        multipartFormData.appendBodyPart(data: keyJSON, name: "format")
                        
                    }) { encodingResult in
                        
                        switch encodingResult {
                        case .Success(let upload, _, _):
                            upload.responseJSON(completionHandler: { response in
                                if let info = response.result.value as? Dictionary<String, AnyObject> {
                                    if let links = info["links"] as? Dictionary<String, AnyObject> {
                                        print(links)
                                        if let imgLink = links["image_link"] as? String {
                                            print("LINK: \(imgLink)")
                                        }
                                    }
                                }
                            })
                            
                        case .Failure(let error):
                            print(error)
                            
                        }
                    }
                }
            } else {
            }

                
                let changeRequest = user.profileChangeRequest()
                
                changeRequest.displayName = usernameField.text
                changeRequest.photoURL =
                    NSURL(string: "https://example.com/jane-q-user/profile.jpg")
                changeRequest.commitChangesWithCompletion { error in
                    if error != nil {
                        // An error happened.
                    } else {
                        // Profile updated.
                    }
                }
            }
        }
        
    }
    
        if let txt = displayNameTF.text where txt != ""{
                }

    

