//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


class MyViewController : UIViewController {

    let bubbleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        view.circular()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        bubbleView.alpha = 0
        view.addSubview(bubbleView)
        bubbleView.centerVertical(with: self.view)
        bubbleView.centerHorizontal(with: self.view)
        keyframeAnimation(for: bubbleView)
    }

    func keyframeAnimation(for view: UIView) {
        let animationDuration: Double = 3
        UIView.animateKeyframes(withDuration: animationDuration,
                                delay: 0,
                                options: [.calculationModeCubicPaced]) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.15) {
                view.center = self.view.center
                view.alpha = 1
            }
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
