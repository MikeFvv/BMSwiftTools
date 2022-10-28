//
//  BMAdaptUI.swift
//  BMSwiftTools
//
//  Created by BLOM on 10/12/22.
//

import Foundation
import UIKit


/// 屏幕宽
public let KScreenWidth = UIScreen.main.bounds.width
/// 屏幕高
public let KScreenHeight = UIScreen.main.bounds.height
/// 状态栏高度
public let kStatusBarHeight: CGFloat = UIDevice.bm_statusBarHeight()
/// 导航栏高度
public let kNavigationBarHeight: CGFloat = UIDevice.bm_navigationBarHeight()
/// 状态栏高度+导航栏高度
public let kNavigationFullHeight: CGFloat = UIDevice.bm_navigationFullHeight()
/// Tabbar高度
public let kTabBarFullHeight: CGFloat = UIDevice.bm_tabBarFullHeight()
/// 底部安全区高度
public let kSafeDistanceBottom: CGFloat = UIDevice.bm_safeDistanceBottom()

/// 当前屏幕比例
public let kScare = UIScreen.main.scale
/// 画线宽度 不同分辨率都是一像素
public let kLineHeight = CGFloat(Scare >= 1 ? 1/Scare: 1)







extension UIDevice {
    
    /// 顶部安全区高度
    static func bm_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }
    
    /// 顶部状态栏高度（包括安全区）
    static func bm_statusBarHeight() -> CGFloat {
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
    static func bm_navigationBarHeight() -> CGFloat {
        return 44.0
    }
    /// 状态栏+导航栏的高度
    static func bm_navigationFullHeight() -> CGFloat {
        return UIDevice.bm_statusBarHeight() + UIDevice.bm_navigationBarHeight()
    }
    
    
    
    /// 底部安全区高度
    static func bm_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }
    
    /// 底部Tabbar高度
    static func bm_tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部Tabbar高度（包括安全区距离）
    static func bm_tabBarFullHeight() -> CGFloat {
        return UIDevice.bm_tabBarHeight() + UIDevice.bm_safeDistanceBottom()
    }
}
