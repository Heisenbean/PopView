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

let RowHeight:CGFloat = 44

var dataSource = ["发布","扫一扫","添加好友"]

/**
 *  popView展现位置的代理
 */
protocol PopViewControllerDelegate:NSObjectProtocol{
    func didClickedPopButton(type:PopViewType)
}

/**
 *  popViewCell选择的代理
 */
protocol DidSelectPopViewCellDelegate:NSObjectProtocol{
    func didSelectRowAtIndexPath(indexPath: NSIndexPath)
}

class PopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myTableView = UITableView()
    
    var popType:PopViewType?
    
    weak var delegate:PopViewControllerDelegate?
    
    weak var selectDelegate:DidSelectPopViewCellDelegate?
    
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
        return RowHeight
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return RowHeight
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return dataSource.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func postNotification(noti:String){
        dismissViewControllerAnimated(true, completion: { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(noti, object: nil)
        })
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectDelegate?.didSelectRowAtIndexPath(indexPath)
    }

}
