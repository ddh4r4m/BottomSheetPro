//
//  BottomSheetPresentationController.swift
//  BottomSheetPro
//
//  Created by Dharam Dhurandhar on 26/01/24.
//

import UIKit

class BottomSheetPresentationController: UIPresentationController {
    
    private lazy var dimmingView: UIView = {
        let view = UIView(frame: containerView?.bounds ?? .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5) // Adjust the dimming color and alpha as needed
        view.alpha = 0.0 // Start fully transparent
        // Add tap gesture to dismiss if needed
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped)))
        return view
    }()
    
    @objc private func dimmingViewTapped(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    // Ensure that the layout of the dimming view is updated in case of any changes in the container view's bounds, such as device rotation:
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        dimmingView.frame = containerView?.bounds ?? .zero
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView, let presentedVC = presentedViewController as? BottomSheetViewController else { return .zero }
        
        // Adjust these values as needed
//        let height = containerView.bounds.height * 0.3 // Example height: 50% of container view
//        let yOffset = containerView.bounds.height - height
        let tempView = presentedVC.view // Example height: 50% of container view
        let height = presentedVC.view.calculateOptimalHeight2() // Example height: 50% of container view
        let yOffset = containerView.bounds.height - height
        debugPrint("  [a] \(containerView.bounds.height)")
        debugPrint("  [b] \(height)")
        debugPrint("  [c] \(yOffset)")
                        debugPrint("  [] \(yOffset)")
        return CGRect(x: 0, y: yOffset, width: containerView.bounds.width, height: height)
    }
    
    /*
     
     "  [a] 852.0"
     "  [b] 255.6"
     "  [c] 596.4"
     "  [] 596.4"
     
     */
    
    
//    override var frameOfPresentedViewInContainerView: CGRect {
//        guard let containerView = containerView, let presentedVC = presentedViewController as? BottomSheetViewController else { return .zero }
//
//        debugPrint(presentedVC.view.calculateOptimalHeight(targetSize: CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude)))
//        let contentHeight = presentedVC.view.calculateOptimalHeight(targetSize: CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude))
//                let containerViewBounds = containerView.bounds
//                let yOffset = max(containerViewBounds.height - contentHeight, 0) // Ensure yOffset is not negative
//        debugPrint("  [] \(containerViewBounds.height)")
//                debugPrint("  [] \(yOffset)")
//                return CGRect(x: 0, y: yOffset, width: containerViewBounds.width, height: contentHeight)
//    }


    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }

        containerView.addSubview(dimmingView)
        dimmingView.frame = containerView.bounds

        // Animate dimming view to visible
        if let transitionCoordinator = presentingViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
        }
    }

    override func dismissalTransitionWillBegin() {
        // Animate dimming view to disappear
        if let transitionCoordinator = presentingViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        }
    }

}


extension UIView {
//    func calculateOptimalHeight(targetSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude)) -> CGFloat {
//        let vieww = self
//        vieww.translatesAutoresizingMaskIntoConstraints = false
//        var newSize = targetSize
//        newSize.width = targetSize.width
//        
//        let widthConstraint = NSLayoutConstraint(item: vieww, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: newSize.width)
//        
//        vieww.addConstraint(widthConstraint)
//        
//        var size = UIView.layoutFittingCompressedSize
//        size.width = newSize.width
//        let viewSize = systemLayoutSizeFitting(size, withHorizontalFittingPriority: UILayoutPriority(1000), verticalFittingPriority: UILayoutPriority(1))
//        debugPrint(viewSize)
//        return viewSize.height
//    }
    
        func calculateOptimalHeight2(targetWidth: CGFloat = UIScreen.main.bounds.width) -> CGFloat {
            // Set up the view for layout computation without altering its state
            self.translatesAutoresizingMaskIntoConstraints = false
            let temporaryWidthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: targetWidth)
            self.addConstraint(temporaryWidthConstraint)
            
            // Calculate the optimal size with the given width
            let targetSize = CGSize(width: targetWidth, height: UIView.layoutFittingCompressedSize.height)
            let optimalSize = self.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
            
            // Clean up by removing the temporary constraint to avoid affecting the actual layout
            self.removeConstraint(temporaryWidthConstraint)
            self.translatesAutoresizingMaskIntoConstraints = true
            self.layoutIfNeeded()
            return optimalSize.height
        }
    


}
