//
//  CustomDismissAnimationController.swift
//  BottomSheetPro
//
//  Created by Dharam Dhurandhar on 26/01/24.
//

import UIKit

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6 // Adjust duration to accommodate the bounce effect
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }

        let initialFrame = fromViewController.view.frame
        let finalFrame = initialFrame.offsetBy(dx: 0, dy: initialFrame.height)

        // Using spring animation for the bouncy effect
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
            fromViewController.view.frame = finalFrame
        }, completion: { finished in
            fromViewController.view.removeFromSuperview()
            transitionContext.completeTransition(finished)
        })
    }
}
