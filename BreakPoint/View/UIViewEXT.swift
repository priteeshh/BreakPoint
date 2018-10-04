//
//  UIViewEXT.swift
//  BreakPoint
//
//  Created by Oneview Infosys on 04/10/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

extension UIView{
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange), name: UIWindow.keyboardWillShowNotification, object: nil)


    }
    @objc func keyBoardWillChange(_ notification : NSNotification){
        let duration = notification.userInfo![UIWindow.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIWindow.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIWindow.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIWindow.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let delta = endingFrame.origin.y - beginningFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += delta
        }, completion: nil)
    }
}

