//
//  UIColor+.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

extension UIColor {

    convenience init(hex: UInt, alpha: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            alpha: alpha
        )
    }

    static let backgroundColor: UIColor = .init(hex: 0x222429)
}
