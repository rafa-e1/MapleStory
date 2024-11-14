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

    func animateLabel(
        duration: Double,
        delay: Double = 0,
        options: UIView.AnimationOptions,
        animations: @escaping () -> Void
    ) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: animations
        )
    }

    func applyLineSeparator() {
        backgroundColor = .gray
        alpha = 0.5
    }
}
