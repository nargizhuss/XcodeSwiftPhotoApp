//
//  LoginViewController.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/27/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // 1. Create a Firebase AuthUI object. If it's fail then return us nil
        let authUI = FUIAuth.defaultAuthUI()
        
        // 2. Check that it isn't nil
        if let authUI = authUI {
            
            // Set self as delegate for the authUI
            authUI.delegate = self
            
            // Set sign in providers. I gotta tell this authUI object what sort of sign in methods we're going to allow or we want to present in the login flow
            authUI.providers = [FUIEmailAuth()]
            
            // Get the prebuilt UI view controller. Returns an instance of the initial view controller of AuthUI.
            let authViewController = authUI.authViewController()
            
            // Present it
            present(authViewController, animated: true, completion: nil)
            
        }
        
    }
    
}
// I can implement those delegate methods separately here. I wanna know if it succeeded of failed.
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        // After creating a new user I'm gonna check if there was an error. If error is not equal to nil
           if error != nil {
           // There was an error
           return
           }
        // If this happens to be nil as there's no profile then it won't access the user's property
        let user = authDataResult?.user
        
        // check if the user is nill
        if let user = user {
        // Got a user
        // Check on the database side if user has a profile
            UserService.retrieveProfile(userId: user.uid) { (user) in
                
        // Check if user is nil
        if user == nil {
        // If not, go to create profile view controller
            self.performSegue(withIdentifier: Constants.Storyboard.profileSegue, sender: self)
                }
                else {
        // If so, go to tab bar controller
            
            
        // Save user to local storageLocal
            LocalStorageService.saveUser(userId: user!.userId, username: user!.username)
                    
        // Create an instance of the tab bar controller
           let tabBarVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.TabBarController)
            
            guard tabBarVC != nil else {
                return
            }
                    
        // Set it as the root view controller of the window
            self.view.window?.rootViewController = tabBarVC
            self.view.window?.makeKeyAndVisible()
                
                }
            }
            
            
        }
        
        
    }
    

    
}
