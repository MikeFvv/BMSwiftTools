//
//  BaseTabBarController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addController()
    }
    
    
    func addController() {
        //设置自己的tabbar
        setValue(BaseTabBar(), forKey: "tabBar")
        
        //设置底部导航栏的颜色
        tabBar.barTintColor = UIColor.white
        
//        addChild("首页", "wifi", "wifi", HomeViewController.self)
        addChild("首页", "wifi", "wifi", DemoViewController.self)
        
        
        addChild("直播", "thumb_pic", "thumb_pic", LiveViewController.self)
        
        addChild("我的", "thumb_pic", "thumb_pic", MeViewController.self)
    }

    func addChild(_ title: String,_ image: String, _ selectedImage: String,_ type: UIViewController.Type) {
        let child = UINavigationController(rootViewController: type.init())
        child.title = title
        child.tabBarItem.title = title
        //设置选中时的文字背景
        child.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .selected)
        child.tabBarItem.image = UIImage.init(named: image)
        child.tabBarItem.selectedImage = UIImage(named: selectedImage)
        addChild(child)
    }

}
