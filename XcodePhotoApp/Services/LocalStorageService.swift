//
//  LocalStorageService.swift
//  XcodePhotoApp
//
//  Created by Nargiz on 8/28/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import Foundation

class LocalStorageService {
    
    static func saveUser(userId:String?, username:String?) {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Save the userId and username to defaults
        defaults.set(userId, forKey: Constants.LocalStorage.userIdKey)
        defaults.set(username, forKey: Constants.LocalStorage.usernameKey)
    }
    
    static func loadUser() -> PhotoUser? {
        
    // Get a reference to user defaults
        let defaults = UserDefaults.standard
    
    // Get the username and id
        let userId = defaults.value(forKey: Constants.LocalStorage.userIdKey) as? String
        let username = defaults.value(forKey: Constants.LocalStorage.usernameKey) as? String
        
    // Return the result
        if userId != nil && username != nil {
        // Return saved user
            return PhotoUser(userId: userId, username: username)
        }
        else {
        // Either user id or username couldn't be retrieved, so return nil
            return nil
        }
}
        
    static func clearUser() {
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Clear the values for the keys
        defaults.set(nil, forKey: Constants.LocalStorage.userIdKey)
        defaults.set(nil, forKey: Constants.LocalStorage.usernameKey)
    }
    
    }
    

