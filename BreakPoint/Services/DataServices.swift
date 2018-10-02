//
//  DataServices.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 02/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()
class DataServices {
    static let instance = DataServices()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEEDS = DB_BASE.child("feeds")
    
    var REF_BASE : DatabaseReference{
        return _REF_BASE
    }
    var REF_USERS : DatabaseReference{
        return _REF_USERS
    }
    var REF_GROUPS : DatabaseReference{
        return _REF_GROUPS
    }
    var REF_FEEDS : DatabaseReference{
        return _REF_FEEDS
    }
    
    func cerateDBUser(uid: String, userData: Dictionary<String,Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
