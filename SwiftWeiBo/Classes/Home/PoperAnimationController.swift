//
//  PoperAnimationController.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/7.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

//MARK:UIViewControllerTransitioningDelegate
class PoperAnimationController : NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    
        var isPresent = false
    
    /*
     presented:将要跳转的控制器
     presenting:发起跳转的控制器
     returns:告诉系统谁负责展现样式
     */
    
    var poperFrame:CGRect?
    
    
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        
        let popperPresonC = PoperPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
        popperPresonC.poperFrame = self.poperFrame
        
        return popperPresonC
        
    }
    
    //显示时谁负责动画
    //返回的对象要遵守协议
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        isPresent = true
        return self
        
        
    }
    
    //消失时谁负责动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresent = false
        return self
    }
    
    
    //设置动画时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.5
    }
    
    
    //获取动画上下文，能得到动画的所有信息，视图显示和消失都会调用这个方法
    //实现这个方法后，动画就需要在这里自定义，系统动画和动画效果会消失
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        //获取到控制器
        //        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        //        let fromeVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        //
        //        print(toVC)
        //        print(fromeVC)
        
        NSNotificationCenter.defaultCenter().postNotificationName(kMenuViewShowORHide, object: nil)
        
        if isPresent == true {
            
            //找到要显示的视图
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            
            transitionContext.containerView()?.addSubview(toView!)
            
            //设置锚点,设置动画的开始位置
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            //首先将Y轴缩放为0
            toView?.transform = CGAffineTransformMakeScale(1, 0)
            
            //设置动画
            UIView.animateWithDuration(0.5, animations: {
                //恢复到原来的尺寸
                toView?.transform = CGAffineTransformIdentity
                
            }) { (_) in
                //动画结束告诉上下文
                transitionContext.completeTransition(true)
            }
            
        }else{
            
            let fromeView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            fromeView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            //设置消失动画
            UIView.animateWithDuration(0.5, animations: {
                
                //将Y轴缩放为0.00001,不能为0
                fromeView?.transform = CGAffineTransformMakeScale(1, 0.00001)
                
                }, completion: { (_) in
                    
                    //动画结束告诉上下文
                    transitionContext.completeTransition(true)
                    
            })
            
        }
        
        
    }
    
    
    //动画显示和消失完毕都会调用这个方法
    func animationEnded(transitionCompleted: Bool){
        
    }
    
}




