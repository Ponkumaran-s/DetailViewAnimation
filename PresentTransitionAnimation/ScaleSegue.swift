//
//  Segue.swift
//  PresentTransitionAnimation
//
//  Created by Ponkumar's Mac on 28/05/20.
//  Copyright © 2020 Ponkumar's Mac. All rights reserved.
//

import UIKit

class ScaleSegue:UIStoryboardSegue {
    public static var startFrameToAnimate:CGRect?
    override func perform() {
        print("Performing Custom Segue Animation")
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension ScaleSegue: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScalePresentAnimator()
    }
}

class ScalePresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        if let toView = toView{
            transitionContext.containerView.addSubview(toView)
        }

        var startFrame:CGRect = CGRect.zero

        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)

        if let startFrameToAnimate = ScaleSegue.startFrameToAnimate {
            startFrame = startFrameToAnimate
            ScaleSegue.startFrameToAnimate = nil
        } else {
            print("Start Frame To Animate Is Not set")
            print("Animation Will Start From (0,0)")
        }
        toView?.frame = startFrame
        toView?.layoutIfNeeded()

        UIView.animate(withDuration: duration, animations: {
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }


}
