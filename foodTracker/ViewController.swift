//
//  ViewController.swift
//  foodTracker
//
//  Created by Makay Chapple on 8/28/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField! //Make sure to connect these events ir swift wont know
    @IBOutlet weak var mealNameLabel: UILabel!  // every time if its a nil crash its because you didnt connect these
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    // do any additional setup from the view typically from a nib
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing( _ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // set photoImageView to display the selected image.
        
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        
        dismiss(animated: true, completion: nil)
        
    }

    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: Any) { //enable user interaction
        // hide the keyoard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    

    @IBAction func setDefaultLabelText(_sender: UIButton) {
        mealNameLabel.text = "Default Label Text"
    }
}








