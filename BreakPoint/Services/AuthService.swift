//
//  AuthService.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 02/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import Foundation
import Firebase
class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email:String, andPassword password:String, userCreationComplete: @escaping (_ status:Bool, _ error:Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else{
                userCreationComplete(false,error)
                return
        }
            let userData = ["provider": user.user.providerID,"email":user.user.email]
            DataServices.instance.cerateDBUser(uid: user.user.providerID, userData: userData)
            userCreationComplete(true,nil)
    }
    }
    func loginUser(withEmail email:String, andPassword password:String, loginUserComplete: @escaping (_ status:Bool, _ error:Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                loginUserComplete(false,error)
                return
            }
            loginUserComplete(true,nil)
            
        }
    }
}

