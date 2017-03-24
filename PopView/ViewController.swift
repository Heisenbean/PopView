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
        modalPopView(PopViewType.left)
    }

    @IBAction func didClickedCenterButton() {
        modalPopView(PopViewType.center)
    }


    @IBAction func didClickeRightButton() {
        modalPopView(PopViewType.right)
    }
    
    let animationDelegate = PopoverAnimation()

    
    func modalPopView(_ type:PopViewType){
        let popVc = PopViewController()
        popVc.popType = type
        popVc.transitioningDelegate = animationDelegate
        animationDelegate.popViewType = type
        popVc.modalPresentationStyle = UIModalPresentationStyle.custom
        popVc.selectDelegate = self
        present(popVc, animated: true, completion: nil)
    }
}

extension ViewController:DidSelectPopViewCellDelegate{
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        print("点击了第\(indexPath.row)个")
    }
}

