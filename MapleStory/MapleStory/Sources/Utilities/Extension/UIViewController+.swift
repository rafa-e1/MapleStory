//
//  UIViewController+.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

extension UIViewController {

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
