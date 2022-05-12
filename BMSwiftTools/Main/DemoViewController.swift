//
//  DemoViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.
//

import UIKit

class DemoViewController: UIViewController {
    
    var numString: String = ""
    private lazy var giveBtnView : GiveBtnView = {
        let instance = GiveBtnView()
        instance.backgroundColor = .white
        instance.layer.borderWidth = 1
        instance.layer.borderColor = RGB(r: 2, g: 168, b: 162).cgColor
        instance.layer.cornerRadius = 31/2
        instance.layer.masksToBounds = true
        return instance
    }()
    var popMenu:GiftPopMenu!

    private lazy var giftNumInputView : GiftNumInputView = {
        let instance = GiftNumInputView()
        instance.delegate = self
        return instance
    }()
    
    private lazy var jggKeyboardView : JGGKeyboardView = {
        let instance = JGGKeyboardView()
        instance.delegate = self
        return instance
    }()
    
    
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

    }
    
    
    func inputKeyboard() {
        giftNumInputView.contentFrame = CGRect(x: 0, y: 550, width: self.view.frame.size.width, height: 50)
        giftNumInputView.show()
        giveBtnView.numLabel.text = "1"
        
    }
    
    func jggKeyboardViewFunc() {
        jggKeyboardView.contentFrame = CGRect(x: 200, y: 550, width: 150, height: 120)
        jggKeyboardView.show()
        giveBtnView.numLabel.text = "0"
        numString = ""
    }
    
}


// MARK: - 创建视图
extension DemoViewController: GiveBtnViewDelegate,GiftNumInputViewDelegate,JGGKeyboardViewDelegate {
    func giveBtnClick() {
        
    }
    
    func selectedListGiftNum() {
        //数据源（icon可不填）
        let popData = [(num:"",icon:"saoyisao",title:"其它数额"),
                        (num:"88888",icon:"",title:""),
                       (num:"520",icon:"saoyisao",title:"我爱你"),
                       (num:"5000",icon:"SignRule",title:"一切顺利"),
                       (num:"10",icon:"saoyisao",title:"十全十美"),
                       (num:"1",icon:"SignRule",title:"一心一意")]
        
        //设置参数
        let parameters:[GiftPopMenuConfigure] = [
            .PopMenuTextColor(UIColor.gray),
            .popMenuItemHeight(30),
            .PopMenuTextFont(UIFont.systemFont(ofSize: 13))
        ]
        
        
        //init  (test随机生成点位置，注意：arrow点是基于屏幕的位置)
        popMenu = GiftPopMenu(menuWidth: 150, arrow: CGPoint(x: giveBtnView.center.x, y: giveBtnView.center.y+50), datas: popData,configures: parameters)

        //click
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            print("block select \(index)")
            
            if index == 0 {
                self?.inputKeyboard()
//                self?.jggKeyboardViewFunc()
                
                return
            }
            let popDict = popData[index]
            self?.giveBtnView.numLabel.text = popDict.num
            self?.popMenu = nil
        }
        //show
        popMenu.show()
    }
    
    
    
    func confirmBtnClick(text: String) {
        giveBtnView.numLabel.text = text
    }
    
    
    
    func jggKeyboardViewDidSelect(string :String) {
        
        if string == "确定" {
            jggKeyboardView.dismiss()
            if numString == "0" {
                giveBtnView.numLabel.text = "1"
                numString = "1"
                return
            }
        } else if string == "⬅️" {
            if numString.count <= 1 {
                giveBtnView.numLabel.text = "1"
                numString = "1"
                return
            }
            numString.removeLast()
        } else {
            if numString.count >= 5 {
                numString = "99999"
            } else {
                numString.append(string)
            }
        }
        giveBtnView.numLabel.text = numString
        
    }
    
    
}



