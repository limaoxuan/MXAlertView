//
//  ViewController.swift
//  MXAlertView
//
//  Created by 李茂轩 on 15/2/6.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button : UIButton?
    var mxAlertView : MXAlertView?
    
    
    func initSubViews(){
    
        
        mxAlertView = MXAlertView()
        self.view.addSubview(mxAlertView!)

        button = UIButton()
        button?.setTitle("show/hidden", forState: UIControlState.Normal)
        button?.backgroundColor = UIColor.blackColor()
        button?.setTranslatesAutoresizingMaskIntoConstraints(false)
        button?.addTarget(self, action: Selector("clickButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button!)
        
        let viewDic = (["button":button!]) as NSDictionary
        let locationH = "H:[button]"
        let locationY = "V:|-50-[button(30)]"

        setConstraintsWithStringHandVWithCurrentView(locationH, locationY, self.view, viewDic)
        setLocationAccrodingWithSuperViewAndCurrentViewSetLayoutAttributeCenterX(self.view, button!, 200)
        
        let s = Selector("clickButton:")
        
        
        
        
    }
    
  @objc  func clickButton(obj:AnyObject!){
    
    
    if mxAlertView?.isOpen == false {
    
    
    mxAlertView?.showAlertAnimation()
    
    
    
    }else if mxAlertView?.isOpen == true {
    
    
    mxAlertView?.hiddenAlertAnimation()
    
    
    }
    
    
    
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        initSubViews()
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

