//
//  KeyboardDismissible.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

protocol KeyboardDismissible {
    func hideKeyboardWhenTappedAround()
}

extension KeyboardDismissible where Self: UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleDismissal)
        )

        view.addGestureRecognizer(tapGesture)
    }
}
