//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2018年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class ExampleViewController: UIViewController {
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 244.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        
        view.backgroundColor = .green
        
        
        stringTest()
    }
    
    
    /// 字符串截取
    func stringTest() {
        
        // 头部截取
        let text = "我是iOS程序员"
        let str1 = text.prefix(3)
        print(str1)
        // 结果: 我是i
           
        // 尾部截取
        let str2 = text.suffix(3)
        print(str2)
        // 结果: 程序员
         
        
        // range 截取
        let index3 = text.index(text.startIndex, offsetBy: 2)
        let index4 = text.index(text.startIndex, offsetBy: 4)
        let str5 = text[index3...index4]
        print(str5)
        // 结果: iOS
         
        // 获取指定位置字符串
        let range = text.range(of: "iOS")!
        print(text[text.startIndex..<range.lowerBound])
        // 结果: 我是
        print(text[text.startIndex..<range.upperBound])
        // 结果: 我是iOS
        
        print(11111)
        
        let timeString = "2016.12.12"

        let index = timeString.index(timeString.endIndex, offsetBy: -2)
        let suffix = timeString.substring(from: index)

        let index1 = timeString.index(timeString.startIndex, offsetBy: 2)
        let prefix = timeString.substring(to: index1)

        let startRange = timeString.index(timeString.startIndex, offsetBy: 5)
        let endRange = timeString.index(timeString.startIndex, offsetBy: 7)
//        let middle = timeString.substring(with: Range(startRange..<endRange))
//
//        // Range使用：
//        let str = "反正我是帅的不要不要！！！你呢？"
//
//        let startIndex = str.startIndex.advancedBy(3) //参数必须大于等于0
//        //以前用法  let startIndex = advance(self.startIndex, r.startIndex)
//        let endIndex = str.endIndex.advancedBy(-3) //参数必须小于0
//
//        let range = Range<String.Index>(start: startIndex, end: endIndex)
//        // swift3.0改变为：
//        let range = Range(startIndex..<endIndex)
//        print(str.startIndex)//起始位置
//        print(str.endIndex)//结束位置
//        print(str.substringWithRange(range))//截取字符串
//        print(str[startIndex])//开始位置的字符
//        print(str[endIndex])//结束位置的字符
//
//        //建议转成把String转成NSString....
//
//            let string = sender.text!
//            var count = 0
//            for c in string.characters {
//                print(c)
//                print(c.debugDescription)
//                if c.debugDescription.validLeterAndFigure {
//                    count += 1
//                } else {
//                    count += 2
//                }
//            }

    }
    
    
    
    //        左到右截取
    //        startIndex to offsetBy正数
    //        右到左截取
    //        endindex from offsetBy负数
//    func ga_dateToDay() -> String {
//
//        let index = self.index(self.endIndex, offsetBy: -2)
//        let suffix = self.substring(from: index)
//        // substring(to: index)
//
//        let startRange = self.index(self.startIndex, offsetBy: 5)
//        let endRange = self.index(self.startIndex, offsetBy: 7)
//        let middle = self.substring(with: Range(startRange..<endRange))
//        // 月
//        let middleInt = Int(middle)
//        // 日
//        let suffixInt = Int(suffix)
//
//        let calendar = Calendar(identifier: .gregorian)
//        let components = calendar.dateComponents([.month, .day], from: Date())
//        // 月
//        let month = components.month
//        // 日
//        let day = components.day
//
//        if month == middleInt {
//            if day == suffixInt {
//                return "今天"
//            }
//            if day![]> suffixInt![]{
//                if day![]- suffixInt![]== 1 {
//                    return "昨天"
//                }
//                return self
//            }
//        } else {
//            if month![]- middleInt![]== 1 {
//                if day == 1 {
//                    return "昨天"
//                }
//            }
//        }
//
//        return self
//    }
    
    
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
}
