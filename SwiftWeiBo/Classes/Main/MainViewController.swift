//
//  MainViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.tabBar.tintColor = UIColor.orangeColor()
        
       self.addTabBarVC()
        
  
        
        
    }
    
//MARK:添加中间按钮
    
      let btn = UIButton(type: .Custom)
    
    private func addMidBtn(){

      
        
        //btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Highlighted)
        let screenW = UIScreen.mainScreen().bounds.size.width
        
        let btnW = screenW/CGFloat((self.viewControllers?.count)!)
        
        let btnH:CGFloat = 49
        
        let btnX = btnW * 2
        
        btn.frame = CGRectMake(btnX, 0, btnW, btnH)
        
        self.tabBar.addSubview(btn)
        
        btn.addTarget(self, action: #selector(MainViewController.clickBtn), forControlEvents: .TouchUpInside)
    }
    
    
    func clickBtn() {
        print("jiahao")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.addMidBtn()
        
    }
    
//MARK:添加子控制器
    
    private func addTabBarVC(){
    
        self.addTabBarChildrenVC("HomeTableViewController", title: "首页", imageName: "tabbar_home")
        self.addTabBarChildrenVC("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
        
        self.addTabBarChildrenVC("NilViewController", title: "", imageName: "")
        
        self.addTabBarChildrenVC("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
        
        self.addTabBarChildrenVC("ProfileTableViewController", title: "我的", imageName: "tabbar_profile")
    
    
    }
    
    
    
    private func addTabBarChildrenVC(className:String,title:String,imageName:String){

        //动态获取命名空间 ：命名空间就是用来区分完全相同的类
        let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        
        //将字符串类名变为类
        let claName:AnyClass = NSClassFromString(/*"SwiftWeiBo"*/nameSpace + "." + className)!
        //指定claName是一个控制器类
        let claVc = claName as! UIViewController.Type
        
        //用转化成控制器的类创建的一个对象
        let Vc = claVc.init()
        
    ////     PS： 工程名中有中文的话，记得在product name修改成英文，设置为全英文，不能有空格
        
      //  let Vc = tempVc
        
        Vc.title = title
        
        Vc.tabBarItem.image = UIImage(named: imageName)
        
        Vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        let nav = UINavigationController(rootViewController: Vc)
        
        self.addChildViewController(nav)
    
    
    }
    
}