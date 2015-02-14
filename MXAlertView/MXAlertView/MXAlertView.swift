//
//  MXAlertView.swift
//  MXAlertView
//
//  Created by 李茂轩 on 15/2/9.
//  Copyright (c) 2015年 lee. All rights reserved.
//



import UIKit


private let dimension = 250 // This is a alertView dimension



class MXAlertView : UIView{
    
    
    var titleLabel : UILabel?
    var cancelButton : UIButton?
    var overLayView : UIView!
    var alertView : UIView!
    var isOpen : Bool = false
    
    
// MARK: - Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupAlertView()
    }
    
    convenience override init() {
        self.init(frame: CGRectMake(0, 0, screenWidth, screenHeight))
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAlertView()
        
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
// MARK: - SetUpMethod


    
    private func setupAlertView(){
        self.alpha = 0
//        self.setTranslatesAutoresizingMaskIntoConstraints(false)

        installOverLayView()
        installAlertView()
       
//        UIAlertView
        
    }
    
    
  
    
    
    private  func installOverLayView(){
        // 灰色的遮挡层
        //        遮挡层的
        overLayView = UIView()
        overLayView.backgroundColor = RGBA(0, 0, 0, 0.3)
        overLayView.alpha = 0
//        overLayView.clipsToBounds = true
        overLayView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(overLayView)
        setLocationCurrentInSuperViewlocationCenter(self,overLayView, Int(screenWidth),Int(screenHeight))
    }
    
    private func installAlertView(){
        
        
        
        alertView = UIView()
        alertView.backgroundColor = UIColor.whiteColor()
        //alertView.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        // 初始尺寸为1.2倍
//        alertView.clipsToBounds = true
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
    
    
// MARK: - AnimationMethod
    
    
    func animationWillStart(){
        
        alertView.layoutIfNeeded()
        alertView.layer.removeAllAnimations()
        
    }

    func showAlertAnimation(){
        
        animationWillStart()
        
        
        if (isOpen == false){
            
            
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.alpha = 1
                self.overLayView.alpha = 1
                self.alertView.alpha = 1
                }, completion: nil)
            
            MXShowAnimation(alertView, AnimationType.Scale)
            
            
            
            
            
            isOpen = true
        }
        
        
        
        
        
    }
    
    
    
    func hiddenAlertAnimation(){
        
        
        animationWillStart()
        
        if(isOpen == true){
            
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.overLayView.alpha = 0
                self.alertView.alpha = 0
                self.alpha = 0
                }, completion: nil)
            
            MXDismissAnimation(alertView, AnimationType.Scale)
            
            isOpen = false
        }
        
        
    }
    
    
    
// MARK: - Location request
//    func setContainerSize(){
//        setLocationCurrentInSuperViewlocationCenter(self.window!,self, Int(screenWidth),Int(screenHeight))
//    }
//    
    
    
    
}