//
//  FrontView.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

final class FrontView: BaseView {

    // MARK: - Properties

    private let characterGuildNameLabel = UILabel()
    private let profileImageView = UIImageView()
    private let characterNameLabel = UILabel()
    private let characterClassLabel = UILabel()
    private let levelTitleLabel = UILabel()
    private let characterLevelLabel = UILabel()
    private let levelStackView = UIStackView()
    private let guideLabel = UILabel()
    
    // MARK: - UI

    override func setStyle() {
        characterGuildNameLabel.do {
            $0.configureLabel(
                size: 30,
                weight: .heavy,
                numberOfLines: 0
            )
        }

        profileImageView.do {
            $0.contentMode = .scaleAspectFill
        }

        characterNameLabel.do {
            $0.configureLabel(
                size: 40,
                weight: .semibold,
                numberOfLines: 0
            )
        }

        characterClassLabel.do {
            $0.configureLabel(
                color: .systemBlue,
                size: 20,
                weight: .semibold,
                numberOfLines: 0
            )
        }

        levelTitleLabel.do {
            $0.configureLabel(
                "Lv.",
                size: 30,
                weight: .regular
            )
        }

        characterLevelLabel.do {
            $0.configureLabel(
                color: .systemRed,
                size: 80,
                weight: .regular
            )
        }

        levelStackView.do {
            $0.configureStackView(
                addArrangedSubviews: levelTitleLabel, characterLevelLabel,
                axis: .horizontal,
                alignment: .lastBaseline,
                distribution: .fillProportionally,
                spacing: 10
            )
        }

        guideLabel.do {
            $0.configureLabel(
                "탭하여 카드 뒤집기",
                color: .white.withAlphaComponent(0.8),
                size: 20,
                weight: .regular
            )

            $0.animateLabel(
                duration: 0.8,
                options: [.autoreverse, .repeat, .allowUserInteraction]
            ) {
                self.guideLabel.alpha = 0
            }
        }
    }

    override func setHierarchy() {
        addSubviews(
            characterGuildNameLabel,
            profileImageView,
            characterNameLabel,
            characterClassLabel,
            levelStackView,
            guideLabel
        )
    }

    override func setLayout() {
        characterGuildNameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().dividedBy(1.2)
            $0.top.greaterThanOrEqualTo(characterGuildNameLabel.snp.bottom)
            $0.height.equalTo(300)
        }

        characterNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom)
            $0.left.equalTo(characterGuildNameLabel)
        }

        characterClassLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(characterNameLabel.snp.bottom)
            $0.left.equalTo(characterNameLabel)
        }

        levelTitleLabel.setContentHuggingPriority(.required, for: .horizontal)

        levelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.greaterThanOrEqualTo(characterNameLabel.snp.bottom).offset(20)
            $0.left.greaterThanOrEqualTo(characterClassLabel)
        }

        guideLabel.snp.makeConstraints {
            $0.top.equalTo(levelStackView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
}
