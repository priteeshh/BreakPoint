//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 02/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var loginEmail: InsetTextField!
    @IBOutlet weak var loginPassword: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signInBtnTapped(_ sender: Any) {
        if loginEmail.text != nil && loginPassword.text != nil{
            AuthService.instance.loginUser(withEmail: loginEmail.text!, andPassword: loginPassword.text!) { (success, loginError) in
                if success{
                    self.dismiss(animated: true, completion: nil)
                }else{
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.loginEmail.text!, andPassword: self.loginPassword.text!, userCreationComplete: { (success, registrationError) in
                    if success{
                        AuthService.instance.loginUser(withEmail: self.loginEmail.text!, andPassword: self.loginPassword.text!, loginUserComplete: { (Success, errorr) in
                            if Success{
                                self.dismiss(animated: true, completion: nil)
                            }else{
                                print(String(describing: errorr?.localizedDescription))
                            }
                            
                        })
                    }else{
                        print(String(describing: registrationError?.localizedDescription))

                    }
                })
            }
        }
    }
    

 

}
