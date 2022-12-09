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
        animateMoreInfoButton()
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
        moreInfoButton.alignBottom(with: view, constant: -20)
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
            self.animateFoodStatView()
            self.foodStatView.config(model: info)
        })
        .disposed(by: disposeBag)
    }

    func animateFoodStatView() {
        let scale = createAnimation(fromValue: 2,
                                    toValue: 1,
                                    duration: 1)

        let opacity = createAnimation(key: "opacity",
                                      fromValue: 0.7,
                                      toValue: 1,
                                      duration: 1)

        let yTransformation = createAnimation(key: "position.y",
                                              fromValue: 200,
                                              toValue: view.center.y,
                                              duration: 1)

        foodStatView.layer.add(scale, forKey: nil)
        foodStatView.layer.add(opacity, forKey: nil)
        foodStatView.layer.add(yTransformation, forKey: nil)
    }

    func animateMoreInfoButton() {
        let buttonYTransformation = createAnimation(key: "position.y",
                                                    fromValue: view.frame.height,
                                                    toValue: view.frame.height - 80,
                                                    duration: 2)

        moreInfoButton.layer.add(buttonYTransformation, forKey: "PositionY")
    }

    func createAnimation(key: String = "transform.scale", fromValue:CGFloat, toValue:CGFloat, duration:CFTimeInterval) -> CASpringAnimation {
        let animation = CASpringAnimation(keyPath: key)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        return animation
    }
}




