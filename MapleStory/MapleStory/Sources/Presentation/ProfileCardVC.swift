//
//  ProfileCardVC.swift
//  MapleStory
//
//  Created by RAFA on 11/13/24.
//

import UIKit

final class ProfileCardVC: BaseViewController {

    // MARK: - Properties

    private let frontView = FrontView()
    private let backView = BackView()

    private var isFrontVisible = true

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setTapGestures()
        fetchCharacterOCID(characterName: "조셉")
    }

    // MARK: - API

    private func fetchCharacterOCID(characterName: String) {
        UserService.getCharacterOCID(characterName: characterName) { result in
            switch result {
            case .success(let ocid):
                print("DEBUG: \(characterName)님의 OCID - \(ocid)")
            case .failure(let failure):
                print("DEBUG: \(failure)")
            }
        }
    }

    // MARK: - Actions

    @objc private func flipCard() {
        let fromView = isFrontVisible ? frontView : backView
        let toView = isFrontVisible ? backView : frontView

        UIView.transition(
            from: fromView,
            to: toView,
            duration: 0.6,
            options: [.transitionFlipFromRight, .showHideTransitionViews]
        ) { _ in
            self.isFrontVisible.toggle()
        }
    }

    // MARK: - Helpers

    private func setTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - UI

    override func setStyle() {
        frontView.isHidden = false
        backView.isHidden = true
    }

    override func setHierarchy() {
        view.addSubviews(frontView, backView)
    }

    override func setLayout() {
        [frontView, backView].forEach { view in
            view.snp.makeConstraints { $0.edges.equalToSuperview() }
        }
    }
}
