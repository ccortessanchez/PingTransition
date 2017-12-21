//
//  CircularTransition.swift
//  Pong
//
//  Created by Carlos Cortés Sánchez on 21/12/2017.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

protocol CircleTransitionable {
    var triggerButton: UIButton { get }
    var contentTextView: UITextView { get }
    var mainView: UIView { get }
}

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? CircleTransitionable,
            let toVC = transitionContext.viewController(forKey: .to) as? CircleTransitionable,
            let snapshot = fromVC.mainView.snapshotView(afterScreenUpdates: false) else {
                transitionContext.completeTransition(false)
                return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(snapshot)
        fromVC.mainView.removeFromSuperview()
        
        let backgroundView = UIView()
        backgroundView.frame = toVC.mainView.frame
        backgroundView.backgroundColor = fromVC.mainView.backgroundColor
        containerView.addSubview(backgroundView)
        
        animateOldTextOffscreen(fromView: snapshot)
        
        containerView.addSubview(toVC.mainView)
        animate(toView: toVC.mainView, fromTriggerButton: fromVC.triggerButton)
    }
    
    func animateOldTextOffscreen(fromView: UIView) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
            fromView.center = CGPoint(x: fromView.center.x - 1300, y: fromView.center.y + 1500)
            fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        }, completion: nil)
    }
    
    func animate(toView: UIView, fromTriggerButton triggerButton: UIButton) {
        
    }
}
