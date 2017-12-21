//
//  CircularTransition.swift
//  Pong
//
//  Created by Carlos Cortés Sánchez on 21/12/2017.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
