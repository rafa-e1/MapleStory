//
//  BaseView.swift
//  MapleStory
//
//  Created by RAFA on 11/13/24.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground

        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle() {}

    func setHierarchy() {}

    func setLayout() {}
}
