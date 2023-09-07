//
//  UIButtonExtension.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 14.07.2023.
//

import Foundation
import UIKit

extension UIButton {
    
    func selectedButtonBackgroundColor() {
        self.backgroundColor = UIColor(red: 46/255, green: 102/255, blue: 156/255, alpha: 1)
    }
    
    func notSelectedButtonBackgroundColor() {
        self.backgroundColor = UIColor(red: 4/255, green: 166/255, blue: 1, alpha: 1)
    }
}
