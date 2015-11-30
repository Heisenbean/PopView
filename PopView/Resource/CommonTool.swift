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