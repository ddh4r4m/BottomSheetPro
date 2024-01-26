//
//  UIViewController+Extension.swift
//  BottomSheetPro
//
//  Created by Dharam Dhurandhar on 26/01/24.
//

import UIKit
import ObjectiveC

extension UIViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return source.shouldUseCustomTransition ? CustomPresentAnimationController() : nil
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissed.shouldUseCustomTransition ? CustomDismissAnimationController() : nil
    }
    
}


private var customTransitionKey: Void?

extension UIViewController {
    var shouldUseCustomTransition: Bool {
        get {
            return objc_getAssociatedObject(self, &customTransitionKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &customTransitionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
