//
//  MenuViewController.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/6.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.layoutUI()
        
        
    }

  
    //布局视图
    func layoutUI() {
     
        let imageView = UIImageView()
        
        var image = UIImage(named: "popover_background")
        
        //上下拉伸，并设置拉伸样式
        image = image?.resizableImageWithCapInsets(UIEdgeInsetsMake(image!.size.height/2, 0, image!.size.height/2, 0), resizingMode: .Stretch)
  
        imageView.image = image
        self.view.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(0)
        }
        
        //tableView
        let tableView = UITableView()
        
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(20)
        }
        
    }

 
    

}
