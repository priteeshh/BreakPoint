//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 02/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil{
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func faceBookLoginBtnTapped(_ sender: Any) {
    }
    
    @IBAction func googleLoginBtnTaooed(_ sender: Any) {
    }
    @IBAction func emailLogginBtnTapped(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)    }
    
}
