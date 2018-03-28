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

var popViewY : CGFloat = 65.0
var mainScreenWidth = UIScreen.main.bounds.size.width
var popViewWidth : CGFloat = 100.0
var popViewHeight : CGFloat = 150.0

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
       
        if UIDevice.current.isiPhoneX() {
            popViewY = 80
            
        }else{
            
        }
        
        switch popViewFrame!{
        case .left:
            if systemVersionLessThan_iOS9(){
                rect = CGRect(x: 2, y: popViewY, width: popViewWidth, height: popViewHeight)
            }else{
                let popViewX : CGFloat = UIDevice.current.isiPhoneX() ? 7 : 5
                rect = CGRect(x: popViewX, y: popViewY, width: popViewWidth, height: popViewHeight)
            }
        case .center:
            let popViewX : CGFloat = UIDevice.current.isiPhoneX() ?  (mainScreenWidth - 120) / 2 - 5 :  (mainScreenWidth - 120) / 2
            rect = CGRect(x:popViewX, y: popViewY, width: popViewWidth, height: popViewHeight)
        default:
            if systemVersionLessThan_iOS9(){
                rect = CGRect(x: (mainScreenWidth - 121), y: popViewY, width: popViewWidth, height: popViewHeight)
            }else{
                let popViewX : CGFloat = UIDevice.current.isiPhoneX() ?  mainScreenWidth - 138 :  mainScreenWidth - 125

                rect = CGRect(x: popViewX, y: popViewY, width: popViewWidth, height: popViewHeight)
            }
        }

        presentedView!.frame = rect!
        
        // 设置遮罩的frame
        coverView.frame = containerView!.bounds
        containerView! .insertSubview(coverView, at: 0)
    }
}
