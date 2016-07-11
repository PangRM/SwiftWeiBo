//
//  UIBarButtonItem+Category.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/6.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem{

    func customBarButtonItem(target:AnyObject?,selector:Selector ,imageName:String) -> UIBarButtonItem {
        
        let btn = UIButton(type: .Custom)
        
        btn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
        
        btn.setBackgroundImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.frame = CGRectMake(0, 0, 40, 40)
        btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: btn)
        
    }
    

    




}

