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


private let sharedInstance = MXAlertView()


class MXAlertView : UIView{
    
    
    var titleLabel : UILabel?
    var cancelButton : UIButton?
    
    class var sharedManager: MXAlertView {
        return sharedInstance
    }
    
    override init() {
        super.init()
        setupAlertView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupAlertView()
    }
    
    func setupAlertView(){
    
    
    titleLabel = UILabel()
        
    
    
        
        
        
        
        
    
    
    }
    
    
    

    
    
}