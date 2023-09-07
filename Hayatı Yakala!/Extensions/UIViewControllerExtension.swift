//
//  extensions.swift
//  Hayatı Yakala!
//
//  Created by Kemal Güler on 16.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func customPresent(_ viewControllerToPresent: UIViewController) { 
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: "customPresent")
        present(viewControllerToPresent, animated: false)
    }
    
    func customPresent2(_ viewControllerTopPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        guard let presentedVC = presentedViewController else { return }
        presentedVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: "customPresent2")
            self.present(viewControllerTopPresent, animated: false)
        }
    }
    
    func customDismiss() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition, forKey: "customDismiss")
        dismiss(animated: false)
    }
}
