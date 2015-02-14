//
//  MXAnimation.swift
//  MXAlertView
//
//  Created by 李茂轩 on 15/2/10.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit

public enum AnimationType{
   
    case Scale // This type can zoom in or zoom out



}





func MXShowAnimation(currentView:UIView,type:AnimationType){
 
    switch type {
    case .Scale :
      scaleShowAnimation(currentView)
    default:
        break
        
    
    
    
    
    }
    
    
    



}

func MXDismissAnimation(currentView:UIView,type:AnimationType){


    switch type {
    case .Scale :
        scaleDissmissAnimation(currentView)
    default:
        break

    
    
    
    }




}


func scaleShowAnimation(currentView:UIView){

    

    let layerPosition = currentView.layer.position
    let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
    //    keyframeAnimation.duration = 1.0
//    keyframeAnimation.delegate = self
    
    //设定关键帧位置，必须含起始与终止位置
    keyframeAnimation.values = [1.2,1,1.1,1]
    
    
    //        timeFunctions属性
    keyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        //        用过UIKit层动画的同学应该对这个属性不陌生，这个属性用以指定时间函数，类似于运动的加速度，有以下几种类型。上例子的AB段就是用了淡入淡出效果。记住，这是一个数组，你有几个子路径就应该传入几个元素
    
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    keyframeAnimation.keyTimes = [0,0.4,0.7,1.0]
    keyframeAnimation.autoreverses = false
    keyframeAnimation.removedOnCompletion = false
    keyframeAnimation.fillMode = kCAFillModeForwards
    //        currentView.layer.position = CGPointMake(layerPosition.x, layerPosition.y)
    keyframeAnimation.duration = 0.6
    
    currentView.layer.addAnimation(keyframeAnimation, forKey: "showCale")


}

func scaleDissmissAnimation(currentView:UIView){

    let layerPosition = currentView.layer.position
    let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
    //    keyframeAnimation.duration = 1.0
//    keyframeAnimation.delegate = self
    
    //设定关键帧位置，必须含起始与终止位置
    keyframeAnimation.values = [1,0.9,0.8,0.7]
    
    
    //        timeFunctions属性
    keyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
    
    //        用过UIKit层动画的同学应该对这个属性不陌生，这个属性用以指定时间函数，类似于运动的加速度，有以下几种类型。上例子的AB段就是用了淡入淡出效果。记住，这是一个数组，你有几个子路径就应该传入几个元素
    
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    keyframeAnimation.keyTimes = [0,0.4,0.8,1]
    keyframeAnimation.autoreverses = false
    keyframeAnimation.removedOnCompletion = false
    keyframeAnimation.fillMode = kCAFillModeForwards
    //        currentView.layer.position = CGPointMake(layerPosition.x, layerPosition.y)
    keyframeAnimation.duration = 0.6
    
    currentView.layer.addAnimation(keyframeAnimation, forKey: "dismissScale")
    




}



