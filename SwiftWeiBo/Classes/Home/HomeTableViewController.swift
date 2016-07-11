//
//  HomeTableViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

let kMenuViewShowORHide = "kMenuViewShowORHide"


class HomeTableViewController: BaseTableViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.noLoginview?.setNoLoginViewisHome(true, imageName: "visitordiscover_feed_image_house", text: "关注一些人，回这里看看有什么惊喜")
        
       self.setNavigationBar()
     
        //监听菜单栏的显示与消失
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.change), name: kMenuViewShowORHide, object: nil)
        
    }
 
    func change() {
        
        let titleBtn = self.navigationItem.titleView as! TitleBuntton
        
        titleBtn.selected = !titleBtn.selected
    }
    
    
    func setNavigationBar(){
    
        if userLogin == true {
            
            let btn = TitleBuntton(type: .Custom)
            btn.setTitle("微博", forState: .Normal)
            btn.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
            btn.sizeToFit()
            self.navigationItem.titleView = btn
            btn.addTarget(self, action: #selector(HomeTableViewController.clickTitleBtn(_:)), forControlEvents: .TouchUpInside)
            
            //设置两侧的BarButtonItem
            self.navigationItem.leftBarButtonItem = UIBarButtonItem().customBarButtonItem(self, selector: #selector(HomeTableViewController.homeClickLeft), imageName: "navigationbar_friendattention")
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem().customBarButtonItem(self, selector: #selector(HomeTableViewController.homeClickRight), imageName: "navigationbar_pop")
        }
        
  
        
    }
    
    func homeClickLeft() {    
        print("ren")
    }
    func homeClickRight() {
        print("二维码")
        
        let sb = UIStoryboard(name: "QRCodeViewController", bundle: nil)
        
       // sb.instantiateInitialViewController()//找到storyboard中左边带箭头的控制器
        
        let QRCodeVC = sb.instantiateViewControllerWithIdentifier("QRCodeViewController")
        
        self.presentViewController(QRCodeVC, animated: true, completion: nil)
        
    }
    
    
    
    func clickTitleBtn(sender:UIButton) {
        
        //sender.selected = !sender.selected
        
        let menuVC = MenuViewController()
        //设置转场动画
        menuVC.modalTransitionStyle = .CoverVertical
        //设置摸态视图的展现样式
        // PS: 如果不自定义，模态控制器会将当前控制器给移除，然后显示在window上，
        
        // 若自定义，模态控制器会直接显示在当前控制器的上面
        menuVC.modalPresentationStyle = .Custom
        
        //因为在代理方法里自定义所以要挂代理
        
        menuVC.transitioningDelegate = self.poperAnimationC
        
        self.presentViewController(menuVC, animated: true, completion: nil)
        
        
    }
    

    
    //控制动画显示的样式的对象
    private var poperAnimationC:PoperAnimationController = {
    
        let vc = PoperAnimationController()
     
        vc.poperFrame = CGRectMake(130,57,200,250)
        
        return vc
        
    }()
    
    
    deinit{
    
        NSNotificationCenter.defaultCenter().removeObserver(self)
    
    }
    
    
    
    
}

