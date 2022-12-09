//
//  AnimationViewController.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 25/11/2022.
//

import UIKit


class AnimationViewController: UIViewController {
    let skyView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0

    let colors: [[UIColor]] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let red = UIColor.red.cgColor
        let pink = UIColor.purple.cgColor
        let green = UIColor.green.cgColor
        let yellow = UIColor.yellow.cgColor

        gradientSet.append([red, pink])
        gradientSet.append([pink, green])
        gradientSet.append([green, yellow])
        gradientSet.append([yellow, red])


        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:1, y:0.5)
        gradient.endPoint = CGPoint(x:0.5, y:1)
        gradient.drawsAsynchronously = true
        skyView.layer.addSublayer(gradient)

        animateGradient()
    }

    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }

        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.addSubview(skyView)
        // setup skyview
        skyView.alignTop(with: view)
        skyView.alignLeadingTrailing(with: view)
        self.gradient.frame = .init(x: 0,
                                    y: 0,
                                    width: 20,
                                    height: 30)


    }
}

/*
class AnimationViewController: UIViewController {

    var buttonWidthConstraint: NSLayoutConstraint?

    let bubbleView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 300, height: 300))
        view.backgroundColor = .clear
        view.applyGradient(isVertical: true, colorArray: [.themeRed, .themeOrange])
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

        let frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        let button = UIButton(frame: frame)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(bubbleView)
        view.addSubview(moreInfoButton)

        moreInfoButton.configurationUpdateHandler = { button in
            button.transform = button.isHighlighted ? CGAffineTransform(scaleX: 0.85, y: 0.85) : .identity
        }

        moreInfoButton.addAction(UIAction(handler: { action in
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut]) {
                self.buttonWidthConstraint?.constant = 100
                self.moreInfoButton.layoutIfNeeded()
//                self.moreInfoButton.configuration?.showsActivityIndicator = true
            } completion: { isAnimated in
//                self.buttonWidthConstraint?.constant = 200
            }
            self.keyframeAnimation(for: self.bubbleView, button: self.moreInfoButton)
        }), for: .touchUpInside)

        bubbleView.centerHorizontal(with: self.view)
        bubbleView.centerVertical(with: self.view)
        bubbleView.constrainHeightToWidth(ratio: 1)
        bubbleView.constrainHeight(self.view.frame.height*0.35)
        bubbleView.circular()

        buttonWidthConstraint = moreInfoButton.constrainWidth(200)
        moreInfoButton.constrainHeight(50)
        moreInfoButton.centerHorizontal(with: self.view)
        moreInfoButton.alignBottom(with: self.view.layoutGuide)

        keyframeAnimation(for: bubbleView, button: moreInfoButton)
    }

    func keyframeAnimation(for view: UIView, button: UIButton) {
        /*
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [60, 0]
        animation.keyTimes = [0,  1]
        animation.duration = 0.4
        animation.isAdditive = true
        moreInfoButton.layer.add(animation, forKey: "shake")
        */

        func createAnimation(key: String = "transform.scale", fromValue:CGFloat, toValue:CGFloat, duration:CFTimeInterval) -> CASpringAnimation {
            let animation = CASpringAnimation(keyPath: key)
            animation.fromValue = fromValue
            animation.toValue = toValue
            animation.duration = duration
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            return animation
        }

        let scale = createAnimation(fromValue: 2, toValue: 1, duration: 1)
        let opacity = createAnimation(key: "opacity", fromValue: 0, toValue: 1, duration: 1.3)
        let yTransformation = createAnimation(key: "position.y", fromValue: -400, toValue: self.view.center.y, duration: 5)
        bubbleView.layer.add(scale, forKey: nil)
        bubbleView.layer.add(opacity, forKey: nil)
        bubbleView.layer.add(yTransformation, forKey: nil)

//        button.layer.add(scale, forKey: nil)
//        button.layer.add(opacity, forKey: nil)
//        let yTransformation2 = createAnimation(key: "position.y", fromValue: self.view.frame.height + 200, toValue: self.view.frame.height - 44 - 20, duration: 5)
//        button.layer.add(yTransformation2, forKey: nil)
    }
}
*/



//class AnimationViewController: UIViewController {
//
//    var buttonWidthConstraint: NSLayoutConstraint?
//
//    let bubbleView: UIView = {
//        let view = UIView(frame: .init(x: -200, y: 300, width: 200, height: 200))
//        view.backgroundColor = .clear
//        view.applyGradient(isVertical: true, colorArray: [.themeRed, .themeOrange])
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemBackground
//        view.addSubview(bubbleView)
//
////        bubbleView.centerHorizontal(with: self.view)
////        bubbleView.centerVertical(with: self.view)
////        bubbleView.constrainHeightToWidth(ratio: 1)
////        bubbleView.constrainHeight(self.view.frame.height*0.35)
////        bubbleView.circular()
//
//        keyframeAnimation(for: bubbleView)
//    }
//
//    func keyframeAnimation(for view: UIView) {
//
//
//
//        var transform = CATransform3D()
//        transform.m42 = 3
//        let transform3d = CATransform3DTranslate(transform, 300, 100, 0)
//        UIView.animateKeyframes(withDuration: 10, delay: 0, options: [.calculationModeCubicPaced]) {
//                UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 1) {
//                    let moveTopRight = CGAffineTransform(translationX: self.view.center.x + 100,
//                                                         y: -100)
//
//                    UIView.animate(withDuration: 1,
//                                 delay: 0,
//                                   usingSpringWithDamping: 0.4,
//                                   initialSpringVelocity: 0.9,
//                                 options: [.curveEaseIn]) {
//                        let anim = CABasicAnimation(keyPath: "transform")
//                        anim.fromValue = CATransform3DMakeRotation(0.5, 250, 0, 0)
//                        anim.toValue = CATransform3DMakeRotation(-0.5, 1, 0, 0)
//                        anim.duration = 1
//                        anim.autoreverses = true
//                        anim.repeatCount = 10
//                        view.layer.add(anim, forKey: "transform")
//
//
//                    } completion: { completed in
//
//                    }
//
//
//                }
//
//
//        } completion: { isCompleted in
//
//        }
//    }
//}
