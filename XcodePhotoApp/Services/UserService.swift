//
//  UserService.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/28/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserService {
    
    static func createProfile (userId:String, username:String, completion: @escaping(PhotoUser?) -> Void ) {
        // Create a dictionary for the profile data
        let profileData = ["username":username]
        
        
        // Get a firestore reference
       let db = Firestore.firestore()
        
        
        // Create a document for the userid
        db.collection("users").document(userId).setData(profileData) { (error) in
            
            // Check for errors
            if error == nil {
            // Profile wsa created successfully
            // Create and return a photo user
            var u = PhotoUser()
                u.username = username
                u.userId = userId
                
                completion(u)
                
            }
            else {
            // Something went wrong
            // Return nil
            completion(nil)
            }
        }
    }
    
    static func retrieveProfile (userId:String, completion: @escaping (PhotoUser?) ->  Void) {
        
        // Get a Firestore reference
        let db = Firestore.firestore()
        
        // Check for a profile, given the user id
        db.collection("users").document(userId).getDocument { (snapshot, error) in
        // Check if there is an error
            if error != nil || snapshot == nil {
        // and something wrong happend
            return
        }
            
        // if there's no error let's try to get the profile. Profile was found, create a new photo user
            if let profile = snapshot!.data() {
                
            //here I'm gonna create a new photo user
                var u = PhotoUser()
                u.userId = snapshot!.documentID
                u.username = profile["username"] as? String
                
            // Return the user
               completion(u)
            }
            else {
                // Couldn't get profile, no profile
                // Return nil
                completion(nil)
            }
    }
    
}
}
