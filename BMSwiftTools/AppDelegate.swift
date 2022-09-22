//
//  AppDelegate.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/12/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //启动后关闭 IQKeyboardManager 键盘功能
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        
        let aa99: Double = 99999.99999999
        let aa44: Double = 99999.444444444
        let aacccc: Double = 19962.50999999999
        let aacccdddc: Double = 1.999999999999
        let aacccdffddc: Double = 999.909999999999
        
        let aaaa = preciseConvertString(num: aa99)
        let bbbb = preciseConvertString(num: aa44)
        let bbbbcc = preciseConvertString(num: aacccc)
        let bbbbccdd = preciseConvertString(num: aacccdddc)
        let bbbbccdffd = preciseConvertString(num: aacccdffddc)
        
        BMLog("111111111111")
        
        return true
    }
    
    
    
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/// 准确的小数尾截取 - 没有进位(不会四舍五入)    超过4位数，自动添加 【万】
/// - Parameter base: 保留的小数点位数
/// - Returns: 返回结果字符串
func preciseConvertString(num: Double, base: Double = 2) -> String {
    
    if num > 9999 {
       let wanNum = num/10000
        let numStr = preciseConvertString(num: wanNum, base: base)
        return "\(numStr)万"
    }
    
    let tempCount: Double = pow(10, base)
    let temp = num * tempCount
    let target = Double(Int(temp))
    let stepone = target/tempCount
    if stepone.truncatingRemainder(dividingBy: 1) == 0 {
        return String(format: "%.0f", stepone)
    } else {
        return "\(stepone)"
    }
}

