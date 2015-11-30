//
//  CommonTool.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright © 2015年 Heisenbean. All rights reserved.
//

import UIKit

    /// 是否小于iOS9
    public func systemVersionLessThan_iOS9() ->Bool{
        let currentVersion = UIDevice.currentDevice().systemVersion
        let flag = currentVersion.compare("9.0.0", options: .NumericSearch)
        if flag == .OrderedAscending{   //小于iOS9
            return true
        }
        return false
    }

public let DidClickedPopViewCell1Noti = "DidClickedPopViewCell1Noti"
public let DidClickedPopViewCell2Noti = "DidClickedPopViewCell2Noti"
public let DidClickedPopViewCell3Noti = "DidClickedPopViewCell3Noti"


extension UIColor {
    
    
    class func colorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func randomColor() -> UIColor {
        
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255, green: CGFloat(arc4random_uniform(256)) / 255, blue: CGFloat(arc4random_uniform(256)) / 255, alpha: 1.0)
    }
}
