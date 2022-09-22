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
        
        mainEEEE()
        
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
    
    
    
    func mainEEEE() {
        
        //获取当前时间
        let now = Date()
        
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前日期时间：\(dformatter.string(from: now))")
        
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        var timeStamp = Int(timeInterval)
        print("当前时间的时间戳：\(timeStamp)")
                    
        timeStamp = 1663833712
        
        let V1: String = "qwertyuiaadfaopasdfghj111klzxcvbnmQWERTYUIOPASDFGHJKLZX12311CVBNM123456dadfasddsadad7890"
        //        let V2: String = "qwertyuiopaaaaaas1231dfghjklzxcvbn121mQWERTYUIOPA1231SDFGHJKLZXCaddddVBNM12dadd34567addadf"
        //        let V3: String = "qwertyuiopaadfaadaddsd121fghjklzxcvbnmQWERTYUIOadfadweradfPASDFGHJKaadLZXCVBN112M1dadf2345addadd0"
        //        let V4: String = "qwertyuiopa1231sdfghjkl12312zxcvbnmQWERTadaaaYUIOPAS12311DFGHJKLZXC3111VBdaafNM1234add567890"
        
        
        let userId = 1011231
        let lenght = V1.count
        
        //从扰乱码中找到字符
        let garIndex: Int = (timeStamp + Int(userId)) % Int(lenght)
        //找到MD5中需要替换的字符
        let md5RepStr = (timeStamp + Int(userId)) % 32
        
        let scrStr = V1[garIndex, 1]
        
        
        /**
         method
         method 方法名称
         uid 会员ID, 如果未登陆为0
         signDate 计算签的时间
         version 扰乱码的版本  strV1，strV2
         如果你通过strV1 计算的扰乱码，version 就发 strV1
         */
        let sginStr = "method=getPaymentList&uid=\(userId)&signDate=\(timeStamp)&version=V1"
        BMLog(sginStr)
        
        // 转MD5
        let md5Strtt = MD5(sginStr)
        
        BMLog(md5Strtt)
        
        // 转Data
        let sumMd5 = md5Strtt.data(using: String.Encoding.utf8)
        //Data转字符串
        var md5Str = String(data: sumMd5!, encoding: String.Encoding.utf8) ?? ""
        
        BMLog(md5Str)
        
        // range 截取
        let tarStr = md5Str[md5RepStr, 1]
        // 交换字符  使用 tarStr 替换 scrStr
//        md5Str = md5Str.replacingOccurrences(of: scrStr, with: tarStr)
        
        // 替换
        md5Str = md5Str.replacingOccurrences(of: tarStr, with: scrStr)
        
        // 转大写
        md5Str = md5Str.uppercased()
        
        BMLog(md5Str)
        
        BMLog("")
        
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




// MARK: - 字符串截取
extension String {
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[3] // c
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    // 截取 从头到i位置
    func substring(to:Int) -> String{
        return self[0..<to]
    }
    // 截取 从i到尾部
    func substring(from:Int) -> String{
        return self[from..<self.count]
    }
    
}
