//
//  UIViewController + Extension.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 18.06.2022.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
