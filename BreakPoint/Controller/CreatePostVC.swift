//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 03/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var userProfilePicImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var postMessageTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        postMessageTextView.delegate = self

    }
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {
        if postMessageTextView.text != "" && postMessageTextView.text != "Post something...."{
            
            DataServices.instance.uploadPost(withMessage: postMessageTextView.text, forUid: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete{
                    self.sendBtn.isEnabled = false
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.sendBtn.isEnabled = true
                    print("ther is an error")
                }
            }
            
            }
        }
    }

extension CreatePostVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        postMessageTextView.text = ""
    }
}
