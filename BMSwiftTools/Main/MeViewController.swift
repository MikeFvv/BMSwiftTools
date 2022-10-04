//
//  MeViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit

class MeViewController: UIViewController {
    
    /// 登录悬浮按钮
    var bubbleWindow : BMBubbleWindow?
    private lazy var bubbleBgView : UIView = {
        let instance = UIView.init(frame: CGRect(x: 200, y: 200, width: 68, height: 68+25))
        instance.backgroundColor = .yellow
        return instance
    }()
    private lazy var bubbleGiftBagIcon: UIImageView = {
        let instance = UIImageView()
        ///instance.loadGif(name: "guizumanghe")
        instance.image = UIImage.init(named: "home-hero-swift-hero")
        return instance
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //        // 布局用到了snpKit，用的时候依据项目本身修改即可
        //        let floatButton = FloatButton(bgColor: UIColor.orange, titleOfButton: "测试")
        //        let firstWindow = UIApplication.shared.windows[0]
        //        firstWindow.addSubview(floatButton)
        //
        //        floatButton.singleClickCallback = { [weak self] in
        //            self?.singleClick()
        //        }
        //        floatButton.snp.makeConstraints { (make) in
        //            make.top.equalTo(80)
        //            make.left.equalTo(20)
        //            make.width.equalTo(80)
        //            make.height.equalTo(50)
        //        }
        
//        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        bubbleBgView.addSubview(bubbleGiftBagIcon)
        bubbleGiftBagIcon.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        
        let bubbleCloseBtn = UIButton(type: .custom)
        bubbleCloseBtn.setBackgroundImage(UIImage(named: "live_bbclose"), for: .normal)
        bubbleCloseBtn.addTarget(self, action: #selector(bubbleCloseBtnClicked), for: .touchUpInside)
        bubbleBgView.addSubview(bubbleCloseBtn)
        bubbleCloseBtn.frame = CGRect(x: 68/2-20/2, y: 68+5, width: 20, height: 20)
        
        
        bubbleWindow = BMBubbleWindow(customView: bubbleBgView, margin: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), level: UIWindow.Level.alert+1,backBlock: {[weak self] in
            guard let strongSelf =  self else{
                return
            }
            //            strongSelf.jumpRegisterLogin()
        })
        bubbleWindow?.show()
        bubbleWindow?.positionY = 300
        bubbleWindow?.position = .Right
        
        bubbleWindow?.backgroundColor = UIColor.red
        
    }
    
    
    
    @objc func bubbleCloseBtnClicked() {
        bubbleWindow?.hidden()
    }
    
    
    // 自定义block回调点击事件
    func singleClick() {
        debugPrint("点击事件调用Success!")
    }
    
}
