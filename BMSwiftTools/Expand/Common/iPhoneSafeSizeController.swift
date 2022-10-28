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
        
        
       let top = UIDevice.bm_safeDistanceTop()
        let BarHeightAddBar = UIDevice.bm_statusBarHeight()
        let vn_navigationFullHeight = UIDevice.bm_navigationFullHeight()
        
        
        let bottom = UIDevice.bm_safeDistanceBottom()
        let vn_tabBarFullHeight = UIDevice.bm_tabBarFullHeight()
        
        
        BMLog("111")
    }
    
}



