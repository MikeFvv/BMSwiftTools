//
//  iPhoneSafeSizeController.swift
//  BMSwiftTools
//
//  Created by BLOM on 9/27/22.
//

import UIKit

class iPhoneSafeSizeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
//        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        
        if let aa = topPadding {
            BMLog("\(aa)")
        }
        
        if let bb = bottomPadding {
            BMLog("\(bb)")
        }
        
        
       let top = UIDevice.vn_safeDistanceTop()
        let BarHeightAddBar = UIDevice.vn_statusBarHeight()
        let vn_navigationFullHeight = UIDevice.vn_navigationFullHeight()
        
        
        let bottom = UIDevice.vn_safeDistanceBottom()
        let vn_tabBarFullHeight = UIDevice.vn_tabBarFullHeight()
        
        
        BMLog("111")
    }
    
}


extension UIDevice {
    
    /// 顶部安全区高度
    static func vn_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }
    
    /// 顶部状态栏高度（包括安全区）
    static func vn_statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    /// 导航栏高度
    static func vn_navigationBarHeight() -> CGFloat {
        return 44.0
    }
    /// 状态栏+导航栏的高度
    static func vn_navigationFullHeight() -> CGFloat {
        return UIDevice.vn_statusBarHeight() + UIDevice.vn_navigationBarHeight()
    }
    
    
    
    /// 底部安全区高度
    static func vn_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }
    
    /// 底部Tabbar高度
    static func vn_tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部Tabbar高度（包括安全区距离）
    static func vn_tabBarFullHeight() -> CGFloat {
        return UIDevice.vn_tabBarHeight() + UIDevice.vn_safeDistanceBottom()
    }
}
