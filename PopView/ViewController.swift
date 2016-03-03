//
//  ViewController.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright © 2015年 Heisenbean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didClickedLeftButton() {
        modalPopView(PopViewType.Left)
    }

    @IBAction func didClickedCenterButton() {
        modalPopView(PopViewType.Center)
    }


    @IBAction func didClickeRightButton() {
        modalPopView(PopViewType.Right)
    }
    
    let animationDelegate = PopoverAnimation()

    
    func modalPopView(type:PopViewType){
        let popVc = PopViewController()
        popVc.popType = type
        popVc.transitioningDelegate = animationDelegate
        animationDelegate.popViewType = type
        popVc.modalPresentationStyle = UIModalPresentationStyle.Custom
        popVc.selectDelegate = self
        presentViewController(popVc, animated: true, completion: nil)
    }
}

extension ViewController:DidSelectPopViewCellDelegate{
    func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        print("点击了第\(indexPath.row)个")
    }
}

