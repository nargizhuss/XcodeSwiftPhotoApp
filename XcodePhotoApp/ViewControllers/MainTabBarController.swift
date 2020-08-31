//
//  MainTabBarController.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/29/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        // Detect which tab was tapped on
        if item.tag == 2 {
            
        // Camera tab was tapped on
            
        // Create the action sheet
        let actionSheet = UIAlertController(title: "Add a Photo", message: "Select a source:", preferredStyle: .actionSheet)
        // Only add the camera button if it's available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
        // Create and add the Camera button
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { (action) in
        
        // Display the UIImagePickerController set to camera mode
            self.showImagePickerController(mode: .camera)
            }
            actionSheet.addAction(cameraButton)
            }
            
        // Only add the library button if it's available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
        // Create and add the Photo Library button
        let libraryBotton = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            
        // Display the UIImagePickerController set to library mode
            self.showImagePickerController(mode: .photoLibrary)
        }
        actionSheet.addAction(libraryBotton)
                
            }
        // Craete and add the Cancel button
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelButton)
            
        // Display the action sheet
        present(actionSheet, animated: true, completion: nil)
        
        }
    }

    func showImagePickerController(mode: UIImagePickerController.SourceType) {
    // Create the picker and set the mode
      let imagePicker = UIImagePickerController()
        imagePicker.sourceType = mode
    // Set the tab bar controller as the delegate
        imagePicker.delegate = self
    // Present the image picker
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension MainTabBarController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
    // Dismiss the image picker
    dismiss(animated: true, completion: nil)
    }
    
    // I wanna be notified if user selected an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    // Get a refference to the selected photo
    let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
    // Check that the selected image isn't nil
   if let selectedImage = selectedImage {
   
    // Get a reference to the camera view controller
    let cameraVC = self.selectedViewController as? CameraViewController
    
    if let cameraVC = cameraVC {
         
        // Upload it
        cameraVC.savePhoto(image: selectedImage)
    }
    
   
    
        
        }
        
    // Dismiss the image picker
    dismiss(animated: true, completion: nil)
    }
    
}
