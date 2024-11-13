//
//  UIView+.swift
//  MapleStory
//
//  Created by RAFA on 11/13/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
