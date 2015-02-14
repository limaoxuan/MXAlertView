//
//  AppDelegate.swift
//  CoinAnimation
//
//  Created by 李茂轩 on 15/2/14.
//  Copyright (c) 2015年 lee. All rights reserved.
//

import UIKit
import CoreData




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coinTrackArrays = NSMutableArray()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.backgroundColor = UIColor.whiteColor()
        
        self.window?.makeKeyAndVisible()
        
        // 灰色的遮挡层
        //        遮挡层的
        let overLayView = UIView()
        overLayView.backgroundColor = RGBA(0, 0, 0, 0.3)
        overLayView.alpha = 0
        overLayView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.window?.addSubview(overLayView)
        
        
        
        setLocationCurrentInSuperViewlocationCenter(self.window!, overLayView,Int(UIScreen.mainScreen().bounds.width),Int(UIScreen.mainScreen().bounds.height))
        
        let alertDimension = 250
        let alertView = UIView()
        alertView.backgroundColor = UIColor.whiteColor()
        //alertView.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        // 初始尺寸为1.2倍
        
        alertView.alpha = 0
        alertView.setTranslatesAutoresizingMaskIntoConstraints(false)
        alertView.layer.cornerRadius = 10
        overLayView.addSubview(alertView)
        
        setLocationCurrentInSuperViewlocationCenter(overLayView, alertView, alertDimension, alertDimension)
        alertView.transform = CGAffineTransformMakeScale(1.2, 1.2)
        //        // 设置阴影
        alertView.layer.shadowColor = UIColor.blackColor().CGColor
        //阴影偏移
        alertView.layer.shadowOffset = CGSizeMake(0, 5)
        // 阴影透明度
        alertView.layer.shadowOpacity = 1
        //阴影尺寸
        alertView.layer.shadowRadius = 10
        
        
        
//        let layer = CALayer(layer: alertView.layer)
        
        //        layer.frame =
        
        
        
        
        // autolayout 必须设置
        //        如果你想要立即刷新你的view,调用layoutIfNeeded
        alertView.layoutIfNeeded()
        alertView.layer.removeAllAnimations()
        //        MXRotateAnimation(alertView)
        
        var minutes = 1 * Double(NSEC_PER_SEC)
        
        var dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minutes))
        dispatch_after(dtime, dispatch_get_main_queue()) { () -> Void in
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                overLayView.alpha = 1
                alertView.alpha = 1
                }, completion: nil)
            MXShowAnimation(alertView, AnimationType.Scale)
        }
        
        minutes = 3 * Double(NSEC_PER_SEC)
        dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(minutes))
        dispatch_after(dtime, dispatch_get_main_queue()) { () -> Void in
            
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                overLayView.alpha = 0
                alertView.alpha = 0
                }, completion: nil)
            MXDismissAnimation(alertView, AnimationType.Scale)
        }
        
        alertView.layoutIfNeeded()
        //        MXKeyframeAnimation(alertView)
        //        MXGroupAnimation(MXScaleAnimation(), animationTwo: MXPositionAnimation(alertView), animationThree: MXRotateAnimation(), currentView: alertView)
        //        MXGroupAnimation(animationOne:MXScaleAnimation(), animationTwo: MXPositionAnimation(), animationThree: MXRotateAnimation(), currentView: alertView)
        return true
    }
    
    
    
    func MXScaleAnimation()->CABasicAnimation{
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.2
        scaleAnimation.toValue = 0.3
        //                scaleAnimation.speed = 2
        //        Autoreverses
        scaleAnimation.removedOnCompletion = false; //完成后是否回到原来状态，如果为NO 就是停留在动画结束时的状态
        //        当你设定这个属性为 YES 时,在它到达目的地之后,动画的返回到开始的值,代替了直接跳转到 开始的值。
        scaleAnimation.autoreverses = false  //是否重播，原动画的倒播
        //animation.fillMode = kCAFillModeRemoved;//动画完成后返回到原来状态
        scaleAnimation.fillMode = kCAFillModeForwards //当动画完成时，保留在动画结束的状态
        scaleAnimation.repeatCount = 0
        scaleAnimation.duration = 2
        
        //        currentView.layer.addAnimation(scaleAnimation, forKey: "scaleAnimation")
        
        return scaleAnimation
        
        
    }
    
    
    func MXPositionAnimation(currentView:UIView)->CABasicAnimation{
        
        
        let positionAnimation = CABasicAnimation(keyPath: "position")
        //        UIGeometry
        
        //        println(currentView.layer.position)
        
        
        
        
        
        positionAnimation.fromValue =    NSValue(CGPoint: currentView.layer.position)
        
        
        positionAnimation.toValue = NSValue(CGPoint: CGPointMake(currentView.layer.position.x, currentView.layer.position.y+100))
        positionAnimation.autoreverses = false
        positionAnimation.fillMode = kCAFillModeForwards
        positionAnimation.removedOnCompletion = false;
        positionAnimation.repeatCount = 0
        positionAnimation.duration = 2
        
        
        
        return positionAnimation
        //        currentView.layer.addAnimation(positionAnimation, forKey: "position")
        
        //   = NSValue(currentView.la)
        
        
        
        
    }
    
    
    func MXRotateAnimation()->CABasicAnimation{
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 6 * M_PI
        rotateAnimation.autoreverses = false
        rotateAnimation.removedOnCompletion = false
        rotateAnimation.repeatCount = 0
        rotateAnimation.fillMode = kCAFillModeForwards
        rotateAnimation.duration = 2
        
        return rotateAnimation
        //      currentView.layer.addAnimation(rotateAnimation, forKey: "transform.rotation.x")
        
        
        
        
        
    }
    
    func MXGroupAnimation(animationOne:CABasicAnimation,animationTwo:CABasicAnimation,animationThree:CABasicAnimation,currentView:UIView){
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = 0
        groupAnimation.removedOnCompletion = false
        groupAnimation.animations  = [animationOne,animationTwo,animationThree]
        currentView.layer.addAnimation(groupAnimation, forKey: "groupAnnimation")
    }
    
    
    func MXKeyframePositionAnimation(currentView:UIView){
        
        let layerPosition = currentView.layer.position
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        //    keyframeAnimation.duration = 1.0
        keyframeAnimation.delegate = self
        
        //设定关键帧位置，必须含起始与终止位置
        keyframeAnimation.values = [NSValue(CGPoint: CGPointMake(layerPosition.x+5, layerPosition.y-3)),NSValue(CGPoint: CGPointMake(layerPosition.x-5, layerPosition.y+6)),NSValue(CGPoint: CGPointMake(layerPosition.x+5, layerPosition.y-6)),NSValue(CGPoint: CGPointMake(layerPosition.x-5, layerPosition.y+3))]
        
        
        //        timeFunctions属性
        keyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        
        //        用过UIKit层动画的同学应该对这个属性不陌生，这个属性用以指定时间函数，类似于运动的加速度，有以下几种类型。上例子的AB段就是用了淡入淡出效果。记住，这是一个数组，你有几个子路径就应该传入几个元素
        
        //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
        keyframeAnimation.keyTimes = [0,0.4,0.8,1.0]
        keyframeAnimation.autoreverses = false
        keyframeAnimation.removedOnCompletion = false
        keyframeAnimation.fillMode = kCAFillModeForwards
        currentView.layer.position = CGPointMake(layerPosition.x, layerPosition.y)
        keyframeAnimation.duration = 0.5
        
        currentView.layer.addAnimation(keyframeAnimation, forKey: "ss")
        
    }
    //
    //    func MXDismissAnimation(currentView:UIView){
    //
    //        let layerPosition = currentView.layer.position
    //        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
    //        //    keyframeAnimation.duration = 1.0
    //        keyframeAnimation.delegate = self
    //
    //        //设定关键帧位置，必须含起始与终止位置
    //        keyframeAnimation.values = [1,0.9,0.8,0.7]
    //
    //
    //        //        timeFunctions属性
    //        keyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
    //
    //        //        用过UIKit层动画的同学应该对这个属性不陌生，这个属性用以指定时间函数，类似于运动的加速度，有以下几种类型。上例子的AB段就是用了淡入淡出效果。记住，这是一个数组，你有几个子路径就应该传入几个元素
    //
    //        //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    //        keyframeAnimation.keyTimes = [0,0.4,0.8,1]
    //        keyframeAnimation.autoreverses = false
    //        keyframeAnimation.removedOnCompletion = false
    //        keyframeAnimation.fillMode = kCAFillModeForwards
    ////        currentView.layer.position = CGPointMake(layerPosition.x, layerPosition.y)
    //        keyframeAnimation.duration = 0.6
    //
    //        currentView.layer.addAnimation(keyframeAnimation, forKey: "ss")
    //
    //    }
    //
    //    func MXKeyframeScaleAnimation(currentView:UIView){
    //
    //        let layerPosition = currentView.layer.position
    //        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
    //        //    keyframeAnimation.duration = 1.0
    ////        keyframeAnimation.delegate = self
    //
    //        //设定关键帧位置，必须含起始与终止位置
    //        keyframeAnimation.values = [1.2,1,1.1,1]
    //
    //
    //        //        timeFunctions属性
    //        keyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
    //
    //        //        用过UIKit层动画的同学应该对这个属性不陌生，这个属性用以指定时间函数，类似于运动的加速度，有以下几种类型。上例子的AB段就是用了淡入淡出效果。记住，这是一个数组，你有几个子路径就应该传入几个元素
    //
    //        //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    //        keyframeAnimation.keyTimes = [0,0.4,0.7,1.0]
    //        keyframeAnimation.autoreverses = false
    //        keyframeAnimation.removedOnCompletion = false
    //        keyframeAnimation.fillMode = kCAFillModeForwards
    //        //        currentView.layer.position = CGPointMake(layerPosition.x, layerPosition.y)
    //        keyframeAnimation.duration = 0.6
    //        
    //        currentView.layer.addAnimation(keyframeAnimation, forKey: "ss")
    //    
    //    
    //    
    //    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.lee.CoinAnimation" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("CoinAnimation", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("CoinAnimation.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}

