//
//  TransitionCoordinator.swift
//  Pong
//
//  Created by Carlos Cortés Sánchez on 21/12/2017.
//  Copyright © 2017 Luke Parham. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CircularTransition()
    }
    
}
