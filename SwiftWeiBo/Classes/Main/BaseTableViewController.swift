//
//  BaseTableViewController.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/5.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    //当前用户是否登录
    var userLogin = true
    
    var noLoginview:NoLoginView?
    
    //当使用到self.view且self.view为空时调用
    override func loadView() {
        
        if userLogin == true {
            //调用父类的loadview加载控制器的视图
            super.loadView()
            
        }else{
            
            noLoginview = NoLoginView()
            
            noLoginview!.backgroundColor = UIColor.whiteColor()
            
            self.view = noLoginview
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(BaseTableViewController.clickRight))
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: #selector(BaseTableViewController.clickLeft))
            
        }
        
        
    }
    
    
    func clickRight() {
        print("注册")
    }
    
    func clickLeft() {
        print("登录")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }



// MARK: - Table view data source
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  
}
