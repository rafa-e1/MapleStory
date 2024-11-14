//
//  CircularProgressView.swift
//  MapleStory
//
//  Created by RAFA on 11/14/24.
//

import UIKit

final class CircularProgressView: UIView {

    // MARK: - Properties

    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()

    var lineWidth: CGFloat = 4.0 {
        didSet {
            progressLayer.lineWidth = lineWidth
            trackLayer.lineWidth = lineWidth
            createCircularPath()
        }
    }

    var progress: Float = 0 {
        didSet {
            setProgress(to: progress)
        }
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayers()
        createCircularPath()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    private func setProgress(to progress: Float) {
        progressLayer.strokeEnd = CGFloat(progress)
    }

    // MARK: - UI

    override func layoutSubviews() {
        super.layoutSubviews()

        createCircularPath()
    }

    private func setupLayers() {
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.darkGray.cgColor
        trackLayer.lineCap = .round
        layer.addSublayer(trackLayer)

        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.systemGreen.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = CGFloat(progress)
        layer.addSublayer(progressLayer)
    }

    private func createCircularPath() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
            radius: (bounds.width - lineWidth) / 2,
            startAngle: -.pi / 2,
            endAngle: .pi * 1.5,
            clockwise: true
        )

        trackLayer.path = circlePath.cgPath
        trackLayer.lineWidth = lineWidth

        progressLayer.path = circlePath.cgPath
        progressLayer.lineWidth = lineWidth
    }
}
