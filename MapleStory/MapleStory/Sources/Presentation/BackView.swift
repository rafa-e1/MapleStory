//
//  BackView.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

final class BackView: BaseView {

    // MARK: - Properties

    // MARK: Character Main Info Section

    private let expLabel = UILabel()
    private let circularProgressView = CircularProgressView()
    private let profileImageView = UIImageView()

    private let characterNameLabel = UILabel()
    private let characterClassLabel = UILabel()

    private let topLineSeparatorView = UIView()

    // MARK: Character Stats Section

    private let popularityLabel = UILabel()
    private let popularityDescriptionLabel = UILabel()
    private let popularityStack = UIStackView()

    private let firstDotSeparatorLabel = UILabel()

    private let levelLabel = UILabel()
    private let levelDescriptionLabel = UILabel()
    private let levelStack = UIStackView()

    private let secondDotSeparatorLabel = UILabel()

    private let classLevelLabel = UILabel()
    private let classLevelDescriptionLabel = UILabel()
    private let classLevelStack = UIStackView()

    private let statsStackView = UIStackView()

    private let bottomLineSeparatorView = UIView()

    // MARK: Character Sub Info Section

    private let guildBox = UIView()
    private let characterGuildNameLabel = UILabel()

    private let worldBox = UIView()
    private let worldNameLabel = UILabel()

    private let creationDateBox = UIView()
    private let daysSinceCreationLabel = UILabel()

    private let gridStackView = UIStackView()

    // MARK: Guide Text Section

    private let guideLabel = UILabel()

    // MARK: - UI

    override func setStyle() {
        expLabel.configureLabel(size: 12, weight: .bold)

        profileImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 60
            $0.clipsToBounds = true
        }

        characterNameLabel.configureLabel(size: 20, weight: .bold)
        characterClassLabel.configureLabel(color: .lightGray, size: 14)
        topLineSeparatorView.applyLineSeparator()
        popularityLabel.configureLabel(size: 30)
        popularityDescriptionLabel.configureLabel("인기도", color: .gray, size: 12)
        firstDotSeparatorLabel.configureDotSeparatorLabel()
        levelLabel.configureLabel(size: 30)
        levelDescriptionLabel.configureLabel("레벨", color: .gray, size: 12)
        secondDotSeparatorLabel.configureDotSeparatorLabel()
        classLevelLabel.configureLabel(size: 30)
        classLevelDescriptionLabel.configureLabel("차", color: .gray, size: 12)
        bottomLineSeparatorView.applyLineSeparator()

        [guildBox, worldBox, creationDateBox].forEach {
            $0.layer.borderWidth = 0.6
            $0.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        }

        characterGuildNameLabel.configureLabel(size: 14)
        worldNameLabel.configureLabel(size: 14)
        daysSinceCreationLabel.configureLabel(size: 14)

        popularityStack.configureStackView(
            addArrangedSubviews: popularityLabel, popularityDescriptionLabel,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 2
        )

        levelStack.configureStackView(
            addArrangedSubviews: levelLabel, levelDescriptionLabel,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 2
        )

        classLevelStack.configureStackView(
            addArrangedSubviews: classLevelLabel, classLevelDescriptionLabel,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 2
        )

        statsStackView.configureStackView(
            addArrangedSubviews:
                popularityStack,
                firstDotSeparatorLabel,
                levelStack,
                secondDotSeparatorLabel,
                classLevelStack,
            axis: .horizontal,
            alignment: .center,
            distribution: .equalSpacing,
            spacing: 30
        )

        gridStackView.configureStackView(
            addArrangedSubviews: guildBox, worldBox, creationDateBox,
            axis: .horizontal,
            alignment: .fill,
            distribution: .fillEqually
        )

        guideLabel.do {
            $0.configureLabel("탭하여 카드 뒤집기", color: .white.withAlphaComponent(0.8), size: 20)

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
            expLabel,
            circularProgressView,
            profileImageView,
            characterNameLabel,
            characterClassLabel,
            topLineSeparatorView,
            statsStackView,
            bottomLineSeparatorView,
            gridStackView,
            guideLabel
        )

        guildBox.addSubview(characterGuildNameLabel)
        worldBox.addSubview(worldNameLabel)
        creationDateBox.addSubview(daysSinceCreationLabel)
    }

    override func setLayout() {
        expLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(-30)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        circularProgressView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(expLabel.snp.bottom).offset(20)
            $0.size.equalTo(240)
        }

        profileImageView.snp.makeConstraints {
            $0.center.equalTo(circularProgressView)
            $0.size.equalTo(200)
        }

        characterNameLabel.snp.makeConstraints {
            $0.top.equalTo(circularProgressView.snp.bottom).offset(10)
            $0.left.equalTo(expLabel)
        }

        characterClassLabel.snp.makeConstraints {
            $0.top.equalTo(characterNameLabel.snp.bottom).offset(4)
            $0.left.equalTo(characterNameLabel)
        }

        topLineSeparatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(characterClassLabel.snp.bottom).offset(20)
            $0.left.equalTo(characterClassLabel)
            $0.height.equalTo(0.6)
        }

        statsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topLineSeparatorView.snp.bottom).offset(20)
            $0.left.greaterThanOrEqualTo(topLineSeparatorView)
        }

        bottomLineSeparatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(statsStackView.snp.bottom).offset(20)
            $0.left.equalTo(topLineSeparatorView)
            $0.height.equalTo(0.6)
        }

        gridStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bottomLineSeparatorView.snp.bottom).offset(20)
            $0.left.equalTo(bottomLineSeparatorView)
            $0.height.equalTo(150)
        }

        [characterGuildNameLabel, worldNameLabel, daysSinceCreationLabel].forEach {
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview().inset(10)
            }
        }

        guideLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(gridStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
