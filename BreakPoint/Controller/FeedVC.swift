//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by Preeteesh Remalli on 02/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var feedsTableView: UITableView!
    var messageArray = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataServices.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.feedsTableView.reloadData()
        }
    }

}
extension FeedVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedVC") as? FeedCellVC
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
      // DataServices.instance.getUserName(forUID: message.senderID) { (userName) in
            cell?.configureFeedCell(profileImage: image!, email: message.senderID, message: message.content)
    //}
        return cell!
    }
    
    
}
