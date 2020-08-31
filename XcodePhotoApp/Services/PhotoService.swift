//
//  PhotoService.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/31/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class PhotoService {
    
    static func savePhoto(image:UIImage) {
        
    // Check that there's a user logged in
        if Auth.auth().currentUser == nil {
            return
        }
        
    // Get the data representation of the UIImage
    let photoData = image.jpegData(compressionQuality: 0.1)
    
        guard photoData != nil else {
        // Error, couldn't get data from the UIImage
        return
        }
        
    // Create a filename
        let filename = UUID().uuidString
        
    // Get the user id of the current user
        let userId = Auth.auth().currentUser!.uid
    // Create a firebase storage path/reference
       let ref = Storage.storage().reference().child("images/\(userId)/\(filename).jpg")
    
    // Upload the data
        ref.putData(photoData!, metadata: nil) { (metadata, error) in
            
    // Check if upload was successful
            if error == nil {
    // Upon successful upload, create the database entry
                self.createDatabaseEntry(ref: ref)
            
            }
 
        }
        
    }
    
    private static func createDatabaseEntry(ref: StorageReference) {
    
    // Download url
    ref.downloadURL { (url, error) in
    // if there's no error, then proceed
    if error == nil {
                
    // Photo id
    let photoId = ref.fullPath
        
    // Get the current user
    let photoUser = LocalStorageService.loadUser()
                
    // User id
    let userId = photoUser?.userId
                   
    // Username
    let username = photoUser?.username
                   
    // Date
    let df = DateFormatter()
    df.dateStyle = .full
            
    let dateString = df.string(from: Date())
            
    // Create a dictionary of the photo metadata
        let metadata = ["photoId":photoId, "byId":userId!, "byUsername:":username!, "date":dateString, "url":url!.absoluteString]
        
    // Save the metadata to the firestore database
        let db = Firestore.firestore()
        
        db.collection("photos").addDocument(data: metadata) { (error) in
        // Check if the saving of data was successful
            if error == nil {
                // Successfully created database entry for the photo
                
            }
        }
                
            }
        }
    
   
        
    }
    
}
