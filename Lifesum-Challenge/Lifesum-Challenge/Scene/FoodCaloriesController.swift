//
//  FoodCaloriesController.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 23/11/2022.
//

import UIKit
import RxSwift
import UICountingLabel

class FoodCaloriesController: UIViewController {

    private var disposeBag = DisposeBag()

    private var viewModel: FoodCaloriesViewModel!

    private var buttonCenterYConstraint: NSLayoutConstraint?

    private var buttonTopConstraint: NSLayoutConstraint?

    private var foodStatView: FoodStatsView = {
        let view = FoodStatsView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var moreInfoButton: UIButton = {
        var attributedContainer = AttributeContainer()
        attributedContainer.font =  UIFont(name: "Avenir-Light", size: 24)
        var configuration = UIButton.Configuration.filled()

        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = .themeBlue
        configuration.imagePadding = 10
        configuration.titlePadding = 10
        configuration.attributedTitle = AttributedString("More Info", attributes: attributedContainer)

        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: FoodCaloriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindUI()
    }

    func setupViews() {
        view.addSubview(foodStatView)
        view.addSubview(moreInfoButton)
        foodStatView.centerHorizontal(with: view)
        foodStatView.centerVertical(with: view)
        foodStatView.constrainWidth(self.view.frame.width * 0.85)
        foodStatView.alpha = 0

        moreInfoButton.constrainHeight(70)
        moreInfoButton.constrainWidth(to: foodStatView)
        moreInfoButton.centerHorizontal(with: foodStatView)

        buttonCenterYConstraint = moreInfoButton.centerVertical(with: view)

    }

    func bindUI() {
        let loadMoreInfo = moreInfoButton.rx.tap.asObservable()

        moreInfoButton.configurationUpdateHandler = { button in
            button.transform = button.isHighlighted ? CGAffineTransform(scaleX: 0.85, y: 0.85) : .identity
        }

        let output = viewModel.transform(input: .init(loadMoreInfo: loadMoreInfo))

        output?.fetching.asObservable().bind { value in
            self.moreInfoButton.configuration?.showsActivityIndicator = value
        }.disposed(by: disposeBag)

        output?.data.asObservable().subscribe(onNext: { info in
            guard let info = info else { return }
            self.animate()
            self.foodStatView.config(model: info)
        })
        .disposed(by: disposeBag)
    }

    func animate() {
        if let centerY = self.buttonCenterYConstraint {
            NSLayoutConstraint.deactivate([centerY])
            self.buttonTopConstraint = moreInfoButton.alignTop(to: foodStatView.bottomAnchor, constant: 20)
            self.foodStatView.containerStackView.alpha = 1
        }

        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 2,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn, animations: {
            self.foodStatView.alpha = 1
            self.foodStatView.containerStackView.alpha = 1
            self.foodStatView.layoutIfNeeded()
        }, completion: nil)
    }
}




