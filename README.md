# PopView
自定义转场动画展现PopView

##介绍:
这种效果类似微信右上角的弹窗,但不同的是,`PopView`加了转场动画,这样看上去更酷一点.

###微信的长这个样子
<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/0.png" height="568" width="320" />

###我的目前看起来是这个样子
<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/1.png" height="568" width="320" />
<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/2.png" height="568" width="320" />
<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/3.png" height="568" width="320" />
<img src="https://github.com/Heisenbean/PopView/raw/master/ScreenShot/4.gif" height="568" width="320" />

-

##用法:

1.将`Resource`文件夹拖入到工程中    

2.点击事件通知的添加和移除
				
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
    
    
3.点击事件的实现

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

4.声明转场动画代理

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
        presentViewController(popVc, animated: true, completion: nil)
    }
    
    
##声明:
1.已适配3.5inch~5.5inch.    
2.iOS8以上可用,iOS8以下没测试过.    
3.有问题随时issue或者邮箱<hdbphil@gmail>联系我.