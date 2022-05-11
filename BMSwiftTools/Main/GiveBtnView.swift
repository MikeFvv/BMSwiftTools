//
//  GiveBtnView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.
//

import UIKit


protocol GiveBtnViewDelegate: NSObjectProtocol {
    func giveBtnClick()
    func selectedListGiftNum()
}



class GiveBtnView: UIView {
    
    weak var delegate: GiveBtnViewDelegate?
    
    private lazy var giveBtn: UIButton = {
        let instance = UIButton(type: .custom)
        instance.backgroundColor = RGB(r: 2, g: 168, b: 162)
        instance.setTitle("赠送", for: .normal)
        instance.setTitleColor(.white, for: .normal)
        instance.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        instance.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        instance.addTarget(self, action: #selector(giveBtnClicked(_:)), for: .touchUpInside)
        instance.layer.cornerRadius = 31/2
        instance.layer.masksToBounds = true
        return instance
    }()
    
    private lazy var numView : UIView = {
        let instance = UIView()
        instance.backgroundColor = .clear
        // tag -> 0:为收起状态 1:为展开状态
        instance.tag = 0
        return instance
    }()
    
    lazy var arrowView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "live_icon_arrow_up")
        return instance
    }()
    
    public lazy var numLabel: UILabel = {
        let instance = UILabel()
        instance.text = "1"
        instance.textColor = .white
        instance.font = .systemFont(ofSize: 12, weight: .medium)
        instance.numberOfLines = 1
        return instance
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc private func giveBtnClicked(_ sender: UIButton) {
        delegate?.giveBtnClick()
    }
    
    @objc func touchEvents(tgr: UITapGestureRecognizer) {
        
        if numView.tag == 0 {
            numView.tag = 1
            arrowView.image = UIImage(named: "live_icon_arrow_down")
            
            numLabel.text = "99999"
        } else {
            numView.tag = 0
            arrowView.image = UIImage(named: "live_icon_arrow_up")
            
            numLabel.text = "1"
        }
        delegate?.selectedListGiftNum()
    }
    
    
    func createUI() {
        backgroundColor = .yellow
        
        
        addSubview(giveBtn)
        giveBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 67, height: 31))
        }
        
        
        addSubview(numView)
        numView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(giveBtn.snp.left)
            make.height.equalTo(31)
        }
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(touchEvents(tgr:)))
        //设置属性
        //tap 手势一共两个属性，一个是设置轻拍次数，一个是设置点击手指个数
        //设置轻拍次数
        tapGes.numberOfTapsRequired = 1;
        //设置手指字数
        tapGes.numberOfTouchesRequired = 1;
        numView.addGestureRecognizer(tapGes)
        
        
        numView.addSubview(numLabel)
        numLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-57/4/2)
        }
        
        numView.addSubview(arrowView)
        arrowView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(numLabel.snp.right).offset(3)
            make.size.equalTo(CGSize(width: 57/4, height: 33/4))
        }
    }
    
    
}
