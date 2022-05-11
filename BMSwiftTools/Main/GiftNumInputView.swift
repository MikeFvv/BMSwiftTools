//
//  GiftNumInputView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/11/22.
//

import UIKit


protocol GiftNumInputViewDelegate: NSObjectProtocol {
    func confirmBtnClick()
}



class GiftNumInputView: UIView {
    
    weak var delegate: GiftNumInputViewDelegate?
    
    private lazy var confirmBtn: UIButton = {
        let instance = UIButton(type: .custom)
        instance.backgroundColor = RGB(r: 2, g: 168, b: 162)
        instance.setTitle("确定", for: .normal)
        instance.setTitleColor(.white, for: .normal)
        instance.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        instance.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        instance.addTarget(self, action: #selector(confirmBtnClicked(_:)), for: .touchUpInside)
        instance.layer.cornerRadius = 5
        instance.layer.masksToBounds = true
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc private func confirmBtnClicked(_ sender: UIButton) {
        delegate?.confirmBtnClick()
    }
    
    func createUI() {
        backgroundColor = .white
        
        
        addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.size.equalTo(CGSize(width: 60, height: 35))
        }
        
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(confirmBtn.snp.left).offset(-10)
            make.height.equalTo(35)
        }
        
    }
    
    
}


// MARK: - 页面显示、隐藏
extension GiftNumInputView {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if touches.first?.view != tableView {
//            dismiss()
//        }
        dismiss()
    }
    
    public func show() {
        createUI()
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    public func dismiss() {
        self.removeFromSuperview()
    }

}
