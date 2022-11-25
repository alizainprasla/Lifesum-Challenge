//
//  FoodStatsView.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 23/11/2022.
//

import UIKit
import UICountingLabel

class FoodStatsView: UIView {

    let containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalSpacing
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var bubbleView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    private let foodNameLabel : UILabel = {
        let attributedString = NSMutableAttributedString(string: "Cashews")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: 1,
                                      range: NSRange(location: 0, length: attributedString.length))
        let label = UILabel()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont(name: "Avenir-Light", size: 22)
        label.textColor = .white
        label.attributedText = attributedString
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let totalCaloriesLabel: UICountingLabel = {
        let label = UICountingLabel()
        label.format = "%d"
        label.method = .linear
        label.animationDuration = 0.2
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont(name: "Avenir-Medium", size: 50)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let caloriesPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.font = UIFont(name: "Avenir", size: 22)?.with(.traitItalic)
        label.textColor = .white
        label.text = "Calories per serving"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let carbsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 22)
        label.text = "Carbs"
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let carbsValueLabel: UICountingLabel = {
        let label = UICountingLabel()
        label.format = "%d"
        label.method = .linear
        label.animationDuration = 0.2
        label.font = UIFont(name: "Avenir-Light", size: 22)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let proteinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 22)
        label.textColor = .white
        label.text = "Protein"
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let proteinValueLabel: UICountingLabel = {
        let label = UICountingLabel()
        label.format = "%d"
        label.method = .linear
        label.animationDuration = 0.2
        label.font = UIFont(name: "Avenir-Light", size: 22)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fatLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 22)
        label.text = "Fat"
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fatValueLabel: UICountingLabel = {
        let label = UICountingLabel()
        label.format = "%d"
        label.method = .linear
        label.animationDuration = 0.2
        label.font = UIFont(name: "Avenir-Light", size: 22)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContraints()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleView.circular()
        bubbleView.applyGradient(isVertical: true, colorArray: [.themeOrange, .themeRed])
    }

    private func setupContraints() {
        addSubview(bubbleView)
        bubbleView.addSubview(containerStackView)
        bubbleView.alignTop(with: self)
        bubbleView.constrainHeightToWidth()
        bubbleView.constrainWidth(to: self, ratio: 1)

        containerStackView.addArrangedSubview(foodNameLabel)
        containerStackView.addArrangedSubview(totalCaloriesLabel)
        containerStackView.addArrangedSubview(caloriesPlaceholderLabel)
        containerStackView.centerVertical(with: bubbleView)
        containerStackView.centerHorizontal(with: bubbleView)

        let carbsStackView = UIStackView(arrangedSubviews: [carbsLabel, carbsValueLabel])
        carbsStackView.axis = .vertical
        carbsStackView.distribution = .equalCentering

        let proteinStackView = UIStackView(arrangedSubviews: [proteinLabel, proteinValueLabel])
        proteinStackView.axis = .vertical
        proteinStackView.distribution = .equalCentering

        let fatStackView = UIStackView(arrangedSubviews: [fatLabel, fatValueLabel])
        fatStackView.axis = .vertical
        fatStackView.distribution = .equalCentering

        let stackView = UIStackView(arrangedSubviews: [carbsStackView,
                                                       proteinStackView,
                                                       fatStackView])

        addSubview(stackView)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignTop(to: bubbleView.bottomAnchor, constant: 20)
        stackView.alignLeadingTrailing(with: self)
        stackView.alignBottom(to: self.bottomAnchor)

    }

    func config(model: FoodInfo) {
        foodNameLabel.attributedText = NSAttributedString(string: model.title)
        totalCaloriesLabel.countFromCurrentValue(to: CGFloat(model.calories))
        carbsValueLabel.countFromCurrentValue(to: CGFloat(model.carbs ?? 0))
        fatValueLabel.countFromCurrentValue(to: CGFloat(model.fat ?? 0))
        proteinValueLabel.countFromCurrentValue(to: CGFloat(model.protein ?? 0))
    }
}
