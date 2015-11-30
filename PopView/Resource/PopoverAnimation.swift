//
//  PopoverAnimation.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright (c) 2015年 Heisenbean. All rights reserved.
//

import UIKit

class PopoverAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    var isPresentation = false
    var presentedFrame = CGRectZero
    var popViewType:PopViewType?
    /// 返回控制 Modal 管理的控制器
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {

        let popover = PopverPresentationController(presentedViewController: presented, presentingViewController: presenting)
        popover.presentedFrame = presentedFrame
        popover.popViewFrame = popViewType!
        return popover
    }
    
    /// 返回提供 Modal 展现动画对象
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Modal
        isPresentation = true
        return self
    }
    
    /// 返回提供 Dismiss 动画的对象
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresentation = false
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    /**
    transitionContext   转场上下文，提供转场动画的相关信息
    主动提供转场的动画，一旦实现了这个方法，原有的转场动画会失效,即目标控制器看不到了
    */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresentation{
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            if let toView = toVC?.view {
                transitionContext.containerView()!.addSubview(toView)
                
                // 动画方法
                toView.transform = CGAffineTransformMakeScale(1.0, 0)
                toView.layer.anchorPoint = CGPointMake(0.5, 0)
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: { () -> Void in
                    
                    toView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                    }, completion: { (_) -> Void in
                        transitionContext.completeTransition(true)
                })}
        }else{
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            fromView.removeFromSuperview()
            // 动画完成
            transitionContext.completeTransition(true)
            
        }
        
    }

}
