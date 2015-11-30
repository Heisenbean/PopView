//
//  PopverPresentationController.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright (c) 2015年 Heisenbean. All rights reserved.
//

import UIKit

enum PopViewFrame{
    case Left
    case Center
    case Right
}

class PopverPresentationController: UIPresentationController {
    /// 展现视图的大小
    var presentedFrame: CGRect = CGRectZero
    
   internal var popViewFrame:PopViewType?
    
    lazy var coverView: UIView = {

        let v = UIView()
        // 遮罩
        v.backgroundColor = UIColor.lightGrayColor()
        v.alpha = 0.3
        let tap = UITapGestureRecognizer(target: self, action: "didClickedCoverView")
        v.addGestureRecognizer(tap)
        return v
    }()
    
    
    /**
    点击遮罩
    */
   internal func didClickedCoverView(){
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 构造方法
 override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        var rect:CGRect?
        switch popViewFrame!{
        case .Left:
            if systemVersionLessThan_iOS9(){
                rect = CGRectMake(2, 65, 100, 150)
            }else{
                rect = CGRectMake(5, 65, 100, 150)
            }
        case .Center:
            rect = CGRectMake((UIScreen.mainScreen().bounds.width - 120) / 2, 65, 100, 150)
        default:
            if systemVersionLessThan_iOS9(){
                rect = CGRectMake((UIScreen.mainScreen().bounds.width - 121), 65, 100, 150)
            }else{
                rect = CGRectMake((UIScreen.mainScreen().bounds.width - 125), 65, 100, 150)
            }
        }

        presentedView()!.frame = rect!
        
        // 设置遮罩的frame
        coverView.frame = containerView!.bounds
        containerView! .insertSubview(coverView, atIndex: 0)
    }
}
