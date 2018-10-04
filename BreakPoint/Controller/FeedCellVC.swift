//
//  FeedCellVC.swift
//  BreakPoint
//
//  Created by Oneview Infosys on 04/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class FeedCellVC: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func configureFeedCell(profileImage : UIImage, email : String, message : String){
        self.profilePic.image = profileImage
        self.userNameLbl.text = email
        self.messageLbl.text = message
    }

}
