//
//  DemoViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.1
//

import UIKit

class DemoViewController: UIViewController {
    
    var numString: String = ""
    private lazy var giveBtnView : GiftSendBtnView = {
        let instance = GiftSendBtnView()
        instance.backgroundColor = .white
        instance.layer.borderWidth = 1
        instance.layer.borderColor = RGB(r: 2, g: 168, b: 162).cgColor
        instance.layer.cornerRadius = 31/2
        instance.layer.masksToBounds = true
        return instance
    }()
    var popMenu:GiftPopMenu!

    private lazy var giftNumView : GiftNumInputView = {
        let instance = GiftNumInputView()
        instance.delegate = self
        return instance
    }()
    
    private lazy var jggKeyboardView : JGGKeyboardView = {
        let instance = JGGKeyboardView()
        instance.delegate = self
        return instance
    }()
    
    private lazy var contentBgView : UIView = {
        let instance = UIView()
        instance.backgroundColor = .white
        instance.layer.borderWidth = 0.3
        instance.layer.borderColor = UIColor.lightGray.cgColor
        return instance
    }()
    public lazy var textField: BMTextField = {
        let instance = BMTextField()
        instance.borderStyle = .none
        instance.backgroundColor = UIColor("eeeeee")
        instance.placeholder = "请输入赠送数量"
        instance.textColor = UIColor.black
        instance.layer.borderWidth = 1.0
        instance.layer.borderColor = UIColor.white.withAlphaComponent(0.4).cgColor
        instance.layer.cornerRadius = 8
        instance.font = .systemFont(ofSize: 12, weight: .medium)
        instance.keyboardType = .numberPad
        instance.returnKeyType = .done
        instance.clearButtonMode = .always
        //        instance.text = "1"
        
        //        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        //        instance.leftView = leftView
        instance.leftViewMode = .whileEditing
        
        instance.maxLength = 5
        instance.addLeftTextPadding(10)
        
        //        instance.addTarget(self, action: #selector(handleTextEndEditing(_:)), for: .editingDidEndOnExit)
        //        instance.addTarget(self, action: #selector(handleTextFieldEditing(textField:)), for: .editingChanged)
        //        instance.attributedPlaceholder = NSAttributedString(string: "设置房间标题", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        
        return instance
    }()
    
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        contentBgView.frame = self.view.bounds
        
        
//        contentBgView.frame = CGRect(x: 0, y: ScreenHeight-50-BottomHomeHeight, width: ScreenWidth, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    
    func createUI() {
        view.backgroundColor = .yellow
        
        let bgBox = UIView()
        bgBox.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        bgBox.layer.borderWidth = 1
        bgBox.layer.borderColor = UIColor.red.cgColor
        view.addSubview(bgBox)
        
        bgBox.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(200)
            make.left.equalTo(view).offset(70)
            make.size.equalTo(300)
        }
        
        
        
        giveBtnView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        giveBtnView.delegate = self
        bgBox.addSubview(giveBtnView)
        
        giveBtnView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bgBox).offset(50)
            make.left.equalTo(bgBox).offset(50)
            make.size.equalTo(CGSize(width: 130, height: 31))
        }

        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(contentBgView)
//        view.addSubview(contentBgView)
        contentBgView.addSubview(textField)
        textField.frame = CGRect(x: 50, y:ScreenHeight-200 , width: ScreenWidth-50*2, height: 50)
    }
    
    
    func inputKeyboard() {
        giftNumView.contentFrame = CGRect(x: 0, y: ScreenHeight-50-BottomHomeHeight, width: ScreenWidth, height: 50)
        giftNumView.show()
        giveBtnView.numLabel.text = "1"
        
    }
    
    func jggKeyboardViewFunc() {
        jggKeyboardView.contentFrame = CGRect(x: 200, y: 550, width: 150, height: 120)
        jggKeyboardView.show()
        giveBtnView.numLabel.text = "0"
        numString = ""
    }
    
}




