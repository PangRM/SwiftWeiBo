//
//  QRCodeViewController.swift
//  SwiftWeiBo
//
//  Created by pangrenmeng on 16/7/7.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

import UIKit

import AVFoundation

class QRCodeViewController: UIViewController {

    //tabBar
    @IBOutlet weak var customTabBar: UITabBar!
    
    //冲击波视图的顶部约束
    @IBOutlet weak var scanLineTop: NSLayoutConstraint!
    
    //Bg视图的高
    @IBOutlet weak var scanBGViewHeight: NSLayoutConstraint!
    
    //冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.customTabBar.selectedItem = self.customTabBar.items![0]
        
        
    }

    //动画要在视图完全显示出来以后再开始
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.startAnimation()
        
        self.startScan()
    }
    
    //开始扫描
    
    private func startScan(){
        
        //1.判断是否支持输入设备 
        if self.session.canAddInput(self.inputDevice) == false {
            return
        }
        
        //2.判断是否支持输出设备
        if self.session.canAddOutput(self.outPut) == false {
            return
        }
        
        //3.添加输入设备
        self.session.addInput(self.inputDevice)
        
        //4.添加输出设备
        self.session.addOutput(self.outPut)
        
        //5.设置输出设备支持的类型
        outPut.metadataObjectTypes = outPut.availableMetadataObjectTypes
        
        //6.设置代理用于获取到扫描的内容
        outPut.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        //7.添加图层
        self.view.layer.insertSublayer(self.previewLayer, atIndex: 0)
        
        //8.开始扫描
        self.session .startRunning()
        
        
    }

    //开始动画
    private func startAnimation(){
        //先让冲击波视图处于扫描视图的上面
        self.scanLineTop.constant = -self.scanBGViewHeight.constant
        //更新约束
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(2) { 
            
            //重复动画
            UIView.setAnimationRepeatCount(MAXFLOAT)
            
            //设置冲击波视图的终点
            self.scanLineTop.constant = 300
            //更新约束
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    //关闭按钮
    @IBAction func closeScanView(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    //MARK:扫描
    //1.获取到扫描会话
    private lazy var session:AVCaptureSession = AVCaptureSession()
    
    //2.获取输入设备
    private lazy var inputDevice:AVCaptureDeviceInput? = {
    
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        //模拟器不支持摄像头
        do{
        
            return try! AVCaptureDeviceInput(device: device)
            
        }catch{
        
            print(error)
            return nil
        
        }
        
    }()
    
    //3.获取到输出设备
    private lazy var outPut:AVCaptureMetadataOutput = AVCaptureMetadataOutput()
   
    //4.获取到预览图层
    private lazy var previewLayer:AVCaptureVideoPreviewLayer = {
        
        let player = AVCaptureVideoPreviewLayer(session: self.session)
        
        player.frame = self.view.frame
        
        //5.设置填充模式
        player.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        return player
        
    }()
    
    
    
   
}



extension QRCodeViewController:UITabBarDelegate,AVCaptureMetadataOutputObjectsDelegate{
    
    //点击item时调用
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        self.scanBGViewHeight.constant = item.tag == 0 ? 300 : 300 * 0.5
        
        self.view.layoutIfNeeded()
        //移除掉原来的动画
        self.scanLineView.layer.removeAllAnimations()
        //重新开始动画
        self.startAnimation()
        
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        print(metadataObjects.last)
        
    }
    
    
    
}





