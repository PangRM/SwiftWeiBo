//
//  PoperPresentationController.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/6.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

class PoperPresentationController: UIPresentationController {

        var poperFrame:CGRect?
    
    
    //试图将要展示的时候调用
    override func containerViewWillLayoutSubviews() {
        
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()

        view.alpha = 0.3
        
        view.frame = UIScreen.mainScreen().bounds
        
        //self.containerView?容器视图，在容器视图上放遮罩
        self.containerView?.insertSubview(view, atIndex: 0)
        
        self.presentedView()?.frame = poperFrame!
        
        //添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(PoperPresentationController.clickMaskView))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func clickMaskView() {
        
        //找到弹出的控制器给销毁
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
