//
//  BaseViewController.swift
//  MapleStory
//
//  Created by RAFA on 11/13/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .backgroundColor

        setStyle()
        setHierarchy()
        setLayout()
    }

    func setStyle() {}

    func setHierarchy() {}

    func setLayout() {}
}
