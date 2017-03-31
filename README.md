# YYPopView
自定义转场动画展现PopView

 ![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)&nbsp;![Wercker](https://img.shields.io/wercker/ci/wercker/docs.svg?maxAge=2592000)&nbsp;![](https://img.shields.io/badge/iOS-Swift3.0-yellow.svg) ![CocoaPods](https://img.shields.io/badge/pod-v0.0.1-779800.svg)
## 介绍:
这种效果类似微信右上角的弹窗,但不同的是,`PopView`加了转场动画,这样看上去更酷一点.

### 微信的长这个样子

<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/5.png" height="568" width="320" />

### 我的目前看起来是这个样子



<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/1.png"/>

<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/4.gif" height="568" width="320" />

-

## 用法:  

### Cocoapod:  

`pod 'YYPopView', '~> 0.0.1'`  

### 手动:  

将`Resource`文件夹拖入到工程中    

#### 具体使用方法:  

1. 选择popView的展现位置`左,中,右`

		@IBAction func didClickedLeftButton() {
	        modalPopView(PopViewType.Left)
	    }
	
	    @IBAction func didClickedCenterButton() {
	        modalPopView(PopViewType.Center)
	    }
	
	
	    @IBAction func didClickeRightButton() {
	        modalPopView(PopViewType.Right)
	    }
  
    
2. 遵守popView的两个代理方法

	    func modalPopView(type:PopViewType){
	        let popVc = PopViewController()
	        popVc.popType = type
	        popVc.transitioningDelegate = animationDelegate
	        popVc.modalPresentationStyle = UIModalPresentationStyle.Custom
	        popVc.selectDelegate = self
	        animationDelegate.popViewType = type
	        presentViewController(popVc, animated: true, completion: nil)
	    }    
    
3. 代理方法的实现

		extension ViewController:DidSelectPopViewCellDelegate{
		    func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
		        print("点击了第\(indexPath.row)个")
		    }
		}
		
## 具体实例请下载项目,参照[ViewController](https://github.com/Heisenbean/PopView/blob/master/PopView/ViewController.swift)

## 声明:
1. 已适配3.5inch~5.5inch.    
2. iOS8以上可用,iOS8以下没测试过.    
3. 有问题随时issue或者邮箱<heisenbean.me@gmail>联系我.
