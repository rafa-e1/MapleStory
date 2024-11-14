//
//  UILabel+.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

extension UILabel {

    func configureLabel(
        _ text: String? = nil,
        color: UIColor = .white,
        alpha: CGFloat = 1.0,
        alignment: NSTextAlignment = .center,
        size: CGFloat,
        weight: UIFont.Weight,
        numberOfLines: Int = 1
    ) {
        self.text = text
        textColor = color
        self.alpha = alpha
        textAlignment = alignment
        font = .systemFont(ofSize: size, weight: weight)
        self.numberOfLines = numberOfLines
    }
}
