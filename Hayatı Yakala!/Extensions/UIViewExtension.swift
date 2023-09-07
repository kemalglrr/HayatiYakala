//
//  UIViewExtension.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 14.07.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func replaceWithKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardReplacement), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc
    func keyboardReplacement(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let keyboardFrameBegin = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrameEnd = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let diffY = keyboardFrameEnd.origin.y - keyboardFrameBegin.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions.init(rawValue: curve), animations: { self.frame.origin.y += diffY})
    }
}
