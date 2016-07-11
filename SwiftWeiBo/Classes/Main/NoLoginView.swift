//
//  NoLoginView.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/5.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

class NoLoginView: UIView {

  
   override init(frame: CGRect) {
    
    super.init(frame: frame)
    
    //添加视图
    self.addSubview(self.markBGView)
    self.addSubview(self.circleView)
    self.addSubview(self.noteLabel)
    self.addSubview(self.iconView)
    //给子视图布局
    
    self.addLayout()
    
    }
    
    func setNoLoginViewisHome(isHome:Bool,imageName:String,text:String){
    
        self.circleView.hidden = !isHome
        self.iconView.image = UIImage(named: imageName)
        self.noteLabel.text = text
        
        if isHome == true {
            self.startAnimation()
        }
        
    }
    
    func startAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI
        
        animation.duration = 12
        
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        self.circleView.layer.addAnimation(animation, forKey: nil)
    }
    
    
    //MARK:给视图添加约束
    
    func addLayout() {
        self.markBGView.snp_makeConstraints { (make) in
            make.edges.equalTo(self).inset(0)
        }
        
        self.circleView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        self.noteLabel.snp_makeConstraints { (make) in
            make.width.equalTo(230)
            make.top.equalTo(self.circleView.snp_bottom).offset(5)
            make.centerX.equalTo(self.circleView.snp_centerX)
        }
        
        self.iconView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }

    }
    
    //背景视图
    private lazy var markBGView:UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        
        return imageView
        
    }()
    
    //圈图
    private lazy var circleView:UIImageView = {
    
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
        return imageView
        
    }()
    //label
    private lazy var noteLabel:UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFontOfSize(17)
        label.textColor = UIColor.darkGrayColor()
        label.text = "暗示的回复个以上的顾客就撒谎发动一估计搜到付款嘉年华ID辅导hi覆盖的   发个"
        label.numberOfLines = 0
        return label
        
    }()
    //圈内图标
    private lazy var iconView:UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        
        return imageView
        
    }()
    
    
    
    //如果父类中有required的构造方法，子类一旦重写任何构造方法，都必须实现父类中的required修饰的方法
    //从xib加载视图是调用
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
