//
//  PopViewController.swift
//  PopView
//
//  Created by Heisenbean on 15/11/30.
//  Copyright © 2015年 Heisenbean. All rights reserved.
//

import UIKit

enum PopViewType{
    case Left
    case Center
    case Right
}

protocol PopViewControllerDelegate:NSObjectProtocol{
    func didClickedPopButton(type:PopViewType)
}

class PopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myTableView = UITableView()
    
    var popType:PopViewType?
    
    weak var delegate:PopViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews(popType!)
    }
    
    func setupViews(popViewtype:PopViewType) {
        var imgStr = ""
        switch popViewtype{
        case .Left:
            imgStr = "popover_background_left"
        case .Center:
            imgStr = "popover_background_center"
        default:
            imgStr = "popover_background_right"
        }
        let img = UIImage(named: imgStr)
        let imgView = UIImageView(image: img)
        imgView.frame.size = CGSizeMake(120, 170)
        view.addSubview(imgView)
        myTableView.frame = CGRectMake(10, 17, 100, 140)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }

}

extension PopViewController{
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
//        cell.contentView.backgroundColor = UIColor.colorFromRGB(0x4d4d4d, alpha: 1.0)
        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "发布"
        case 1:
            cell.textLabel?.text = "扫一扫"
        default:
            cell.textLabel?.text = "添加好友"
        }
        return cell
    }
    
    func postNotification(noti:String){
        dismissViewControllerAnimated(true, completion: { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(noti, object: nil)
        })
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0:
            postNotification(DidClickedPopViewCell1Noti)
        case 1:
            postNotification(DidClickedPopViewCell2Noti)
        default:
            postNotification(DidClickedPopViewCell3Noti)
        }
        
    }

}
