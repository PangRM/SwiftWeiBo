//
//  TitleBuntton.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/5.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

class TitleBuntton: UIButton {

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Selected)
        
    }
    
    //将button修改为左字右图
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel?.frame.origin.x = 0
        
        self.imageView?.frame.origin.x = (self.titleLabel?.frame.size.width)! + 5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
