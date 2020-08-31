//
//  CreateProfileViewController.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/27/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateProfileViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        // Check that there is a user logged in
        guard Auth.auth().currentUser != nil else {
            
            return
        // No user logged in
        }
        
        // Get the username
        // Check it against whitespaces, new lines, illegal characters etc
        let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check that the username isn't nil
        if username == nil || username == "" {
        // Show an error message
        return
        }
        
        // Call the userservice to create the profile
        UserService.createProfile(userId: Auth.auth().currentUser!.uid, username: username!) { (user) in
            
        // Check if it was created successfully
            if user != nil {
        // If so, go to the tab bar controller
                
        // Save the user to local storage
                LocalStorageService.saveUser(userId: user!.userId, username: user!.username)
                
                let tabBarVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.TabBarController)
                
                self.view.window?.rootViewController = tabBarVC
                self.view.window?.makeKeyAndVisible()
                
            }
            else {
        // If not, display error
        
        }
    }
    
}
}
