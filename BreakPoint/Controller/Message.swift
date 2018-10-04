//
//  Message.swift
//  BreakPoint
//
//  Created by Oneview Infosys on 04/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import Foundation
class Message{
    private var _content : String
    private var _senderID : String
    
    var content : String{
        return _content
    }
    var senderID : String{
        return _senderID
    }
    init(content : String, senderId : String) {
        self._content = content
        self._senderID = senderId
    }
}
