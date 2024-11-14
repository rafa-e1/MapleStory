//
//  UIStackView+.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

extension UIStackView {

    func configureStackView(
        addArrangedSubviews: UIView...,
        axis: NSLayoutConstraint.Axis = .vertical,
        alignment: UIStackView.Alignment,
        distribution: UIStackView.Distribution,
        spacing: CGFloat = 0
    ) {
        addArrangedSubviews.forEach(addArrangedSubview)
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
