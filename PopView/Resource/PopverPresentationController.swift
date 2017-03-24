//
//  PopverPresentationController.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright (c) 2015年 Heisenbean. All rights reserved.
//

import UIKit

enum PopViewFrame{
    case left
    case center
    case right
}

class PopverPresentationController: UIPresentationController {
    /// 展现视图的大小
    var presentedFrame: CGRect = CGRect.zero
    
   internal var popViewFrame:PopViewType?
    
    lazy var coverView: UIView = {

        let v = UIView()
        // 遮罩
        v.backgroundColor = UIColor.lightGray
        v.alpha = 0.3
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopverPresentationController.didClickedCoverView))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    
    /**
    点击遮罩
    */
   internal func didClickedCoverView(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    // 构造方法
 override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        var rect:CGRect?
        switch popViewFrame!{
        case .left:
            if systemVersionLessThan_iOS9(){
                rect = CGRect(x: 2, y: 65, width: 100, height: 150)
            }else{
                rect = CGRect(x: 5, y: 65, width: 100, height: 150)
            }
        case .center:
            rect = CGRect(x: (UIScreen.main.bounds.width - 120) / 2, y: 65, width: 100, height: 150)
        default:
            if systemVersionLessThan_iOS9(){
                rect = CGRect(x: (UIScreen.main.bounds.width - 121), y: 65, width: 100, height: 150)
            }else{
                rect = CGRect(x: (UIScreen.main.bounds.width - 125), y: 65, width: 100, height: 150)
            }
        }

        presentedView!.frame = rect!
        
        // 设置遮罩的frame
        coverView.frame = containerView!.bounds
        containerView! .insertSubview(coverView, at: 0)
    }
}
