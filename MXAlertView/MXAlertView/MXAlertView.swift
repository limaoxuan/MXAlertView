//
//  MXAlertView.swift
//  MXAlertView
//
//  Created by 李茂轩 on 15/2/9.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit




//public enum MXAlertViewTypes {
//
//case Warning
//    
//case Progress
//    
//case Default
//
//
//
//
//
//
//}
private let dimension = 250

private let sharedInstance = MXAlertView()


class MXAlertView : UIView{
    
    
    var titleLabel : UILabel?
    var cancelButton : UIButton?
    var overLayView : UIView!
    
    
    class var sharedManager: MXAlertView {
        return sharedInstance
    }
    
    override init() {
        super.init()
        setupAlertView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
   private func setupAlertView(){
    

    installOverLayView()
    
    

    }
    
    private  func installOverLayView(){
        // 灰色的遮挡层
        //        遮挡层的
        overLayView = UIView()
        overLayView.backgroundColor = RGBA(0, 0, 0, 0.3)
        overLayView.alpha = 0
        overLayView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(overLayView)
        setLocationCurrentInSuperViewlocationCenter(self,overLayView, Int(screenWidth),Int(screenHeight))
    }
    
    private func installAlertView(){
    
    
    
        let alertView = UIView()
        alertView.backgroundColor = UIColor.whiteColor()
        //alertView.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        // 初始尺寸为1.2倍
        
        alertView.alpha = 0
        alertView.setTranslatesAutoresizingMaskIntoConstraints(false)
        alertView.layer.cornerRadius = 10
        
        
        alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
        //        // 设置阴影
        alertView.layer.shadowColor = UIColor.blackColor().CGColor
        //阴影偏移
        alertView.layer.shadowOffset = CGSizeMake(0, 5)
        // 阴影透明度
        alertView.layer.shadowOpacity = 1
        //阴影尺寸
        alertView.layer.shadowRadius = 10
        
        overLayView.addSubview(alertView)
        
        setLocationCurrentInSuperViewlocationCenter(overLayView, alertView, dimension, dimension)
    }
    
    
    func showAnimation(){
    
    
    
    
    
    
    
    
    
    }
    
    func hiddenAnimation(){
    
    
    
    
    
    
    
    }
    
    
    
    

    
    
}