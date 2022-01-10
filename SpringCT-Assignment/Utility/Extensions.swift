//
//  Extensions.swift
//  SpringCT-Assignment
//
//  Created by Sachin Ambegave on 10/01/22.
//

import UIKit.UIViewController
import UIKit

extension UIViewController {
    
    func showAlert(title _title: String, message _message: String) {
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .cancel)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
