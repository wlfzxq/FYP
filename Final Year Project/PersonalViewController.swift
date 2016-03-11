//
//  PersonalViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /239/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit


class PersonalViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    var isEdit = false
    var tempName = variables.defaults.objectForKey("userName")!
    let imagePicKer = UIImagePickerController()
    var photoPath = "\(variables.filePath)/profile_photo.png"

    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pickImageBtn: UIButton!
    
    @IBAction func selectiveSegue(sender: AnyObject) {
        if edit.titleForState(.Normal) == "Edit"{
            self.performSegueWithIdentifier("toEdit", sender: self)
        }
        else{
            
            tempName = nameField.text!
            variables.defaults.setObject(tempName, forKey: "userName")
            print("saving image")
            print("Path: \(photoPath)")
            
            self.performSegueWithIdentifier("backToSelf", sender: self)
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.blackColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.width/2
        profilePic.clipsToBounds = true
        tempName = variables.defaults.objectForKey("userName")!
        if let image = UIImage(contentsOfFile: photoPath){
            print("loading image")
            profilePic.image = image}
        if isEdit {
            nameField.placeholder = nameLabel.text
            nameField.hidden = false
            nameLabel.hidden = true
            pickImageBtn.hidden = false
        }
        else{
            nameLabel.text = tempName as! String
            nameField.placeholder = nameLabel.text
            nameField.hidden = true
            nameLabel.hidden = false
            pickImageBtn.hidden = true
        }
        
    }
    
    @IBAction func backToSelf(segue: UIStoryboardSegue){
 
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicKer.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? UINavigationController{
        let viewController = controller.topViewController as! PersonalViewController
            viewController.edit.setTitle("Done", forState: .Normal)
            viewController.isEdit = true
            }


        
        
    }
    @IBAction func pickNewProfilePhoto(sender: AnyObject) {
        imagePicKer.allowsEditing = false
        imagePicKer.sourceType = .PhotoLibrary
        presentViewController(imagePicKer, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            print("picking image")
            profilePic.contentMode = .ScaleAspectFill
            profilePic.image = pickedImage
            let image = UIImagePNGRepresentation(profilePic.image!)
            
            variables.fileManager.createFileAtPath(photoPath, contents: image, attributes: nil)
        }
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
