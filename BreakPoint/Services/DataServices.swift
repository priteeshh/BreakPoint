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
    func getUserName(forUID uid: String, handler : @escaping (_ username: String)->()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapShot) in
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapShot{
                if user.key == uid{
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
            
        }
    }
    func uploadPost(withMessage message: String, forUid uid : String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status : Bool)->()){
        if groupKey != nil{
            
        }else{
            REF_FEEDS.childByAutoId().updateChildValues(["content":message,"senderID":uid])
            sendComplete(true)
        }
    }
    func getAllFeedMessages(handler: @escaping(_ messages:[Message]) -> ()){
        var messageArray = [Message]()
        REF_FEEDS.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else{return}
            for message in feedMessageSnapshot{
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderId: senderID)
                messageArray.append(message)
            }
            handler(messageArray)
        }
    }
}
