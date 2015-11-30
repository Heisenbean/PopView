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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didClickedFirstCell", name: DidClickedPopViewCell1Noti, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didClickedSecondCell", name: DidClickedPopViewCell2Noti, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didClickedThirdCell", name: DidClickedPopViewCell3Noti, object: nil)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func didClickedFirstCell(){
        // modal/push Other Controller
        print(__FUNCTION__)
    }
    
    func didClickedSecondCell(){
        print(__FUNCTION__)
    }
    
    func didClickedThirdCell(){
        print(__FUNCTION__)
    }
    
    
    let animationDelegate = PopoverAnimation()

    @IBAction func didClickedLeftButton() {
        modalPopView(PopViewType.Left)
    }

    @IBAction func didClickedCenterButton() {
        modalPopView(PopViewType.Center)
    }


    @IBAction func didClickeRightButton() {
        modalPopView(PopViewType.Right)
    }
    
    func modalPopView(type:PopViewType){
        let popVc = PopViewController()
        popVc.popType = type
        popVc.transitioningDelegate = animationDelegate
        animationDelegate.popViewType = type
        popVc.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(popVc, animated: true, completion: nil)
    }
    

}

