//
//  ViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    
    // MARK:字符串的子串
    // 建议:一般使用NSString中转
    func test()  {
        let str = "好好学习，天天向上"
        let ocStr = str as NSString
        let s1 = ocStr.substring(with: NSMakeRange(2, 5))
        print(s1)
    }
}

