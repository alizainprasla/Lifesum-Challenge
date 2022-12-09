//
//  UIView+Extension.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 23/11/2022.
//

import UIKit

extension UIView {

    @discardableResult
    func align(with view: UIView, constant: CGFloat = 0.0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant),
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult
    func alignLeadingTrailing(with view: UIView, constant: CGFloat = 0.0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constant),
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult
    func alignTopBottom(with view: UIView, constant: CGFloat = 0.0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult
    func alignTopBottom(with layoutGuide: UILayoutGuide, constant: CGFloat = 0.0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -constant),
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @discardableResult
    func alignTop(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0,
                  priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    func alignTop(with guide: UILayoutGuide, constant: CGFloat = 0.0,
                  priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignTop(to: guide.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTop(with view: UIView, constant: CGFloat = 0.0,
                  priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignTop(to: view.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0,
                     priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    func alignBottom(with guide: UILayoutGuide, constant: CGFloat = 0.0,
                     priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignBottom(to: guide.bottomAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignBottom(with view: UIView, constant: CGFloat = 0.0,
                     priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignBottom(to: view.bottomAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignLeading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0,
                      priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func alignLeading(with view: UIView, constant: CGFloat = 0.0,
                      priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignLeading(to: view.leadingAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0,
                       priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func alignTrailing(with view: UIView, constant: CGFloat = 0.0,
                       priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignTrailing(to: view.trailingAnchor, constant: constant, priority: priority, isActive: isActive)
    }


    @discardableResult
    func alignBottom(toTopOf view: UIView, constant: CGFloat = 0.0,
                     priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignBottom(to: view.topAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func alignTrailing(toLeadingOf view: UIView, constant: CGFloat = 0.0,
                       priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        return alignTrailing(to: view.leadingAnchor, constant: constant, priority: priority, isActive: isActive)
    }

    @discardableResult
    func centerVertical(with view: UIView, constant: CGFloat = 0.0,
                        priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func centerHorizontal(with view: UIView, constant: CGFloat = 0.0,
                          priority: UILayoutPriority = .required, isActive: Bool = true) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainHeight(_ value: CGFloat, priority: UILayoutPriority = .required,
                         isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: value)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainWidth(_ value: CGFloat, priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: value)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainWidth(to view: UIView, priority: UILayoutPriority = .required,
                        isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainHeight(to view: UIView, priority: UILayoutPriority = .required,
                         isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: view.heightAnchor)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    func constraintSize(width: CGFloat, height: CGFloat,
                        priority: UILayoutPriority = .required, isActive: Bool = true) {
        constrainWidth(width, priority: priority, isActive: isActive)
        constrainHeight(height, priority: priority, isActive: isActive)
    }

    @discardableResult
    func constrainHeightToWidth(ratio: CGFloat = 1, priority: UILayoutPriority = .required,
                                isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: ratio)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainWidth(to view: UIView, ratio: CGFloat = 1, priority: UILayoutPriority = .required,
                                isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainWidthToHeight(ratio: CGFloat = 1, priority: UILayoutPriority = .required,
                                isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }

    @discardableResult
    func constrainHeight(to view: UIView, ratio: CGFloat = 1, priority: UILayoutPriority = .required,
                                isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio)
        constraint.isActive = isActive
        constraint.priority = priority
        return constraint
    }
}

extension UIView {
    var layoutGuide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }

    func cornerRadius(radius: CGFloat = 10) {
        layer.cornerRadius = radius
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.withAlphaComponent(0.06).cgColor
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }

    func circular() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }

    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }

        backgroundColor = .clear
        gradientLayer.frame = bounds
        gradientLayer.drawsAsynchronously = true
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func applyShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
}
