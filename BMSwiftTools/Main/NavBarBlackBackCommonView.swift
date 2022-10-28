//
//  NavBarBlackBackCommonView.swift
//  venom
//
//  Created by  moore on 2022/8/1.
//  Copyright © 2022 Venom. All rights reserved.
//

import UIKit

class NavBarBlackBackCommonView: UIView {

    typealias LeftBlock  = () -> Void
    typealias RightBlock = () -> Void
    var rightBlock:RightBlock?
    var leftBlock:LeftBlock?
  
    var leftIsPop = true //左边的按钮是否是返回
    
    public lazy var navView: UIImageView = {
        let instance = UIImageView()
        instance.backgroundColor = .clear
        return instance
    }()
    
    public lazy var smallNavView: UIView = {
        let instance = UIView()
        instance.backgroundColor = .white
        return instance
    }()
    
    public lazy var navTitle: UILabel = {
        let instance = UILabel()
        instance.textColor = UIColor(hex: "333333")
        instance.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        instance.textAlignment = .center
        return instance
    }()
    
    public lazy var backButton: UIButton = {
        let instance = UIButton()
        instance.setImage(UIImage.init(named: "top_back"), for: .normal)
        instance.isHighlighted = false
//        instance.imageView?.contentMode = .scaleAspectFit
        instance.addTarget(self, action: #selector(didBack), for: .touchUpInside)
        return instance
    }()
    
    private lazy var rightButton: UIButton = {
        let instance = UIButton(type: .custom)
//        instance.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        instance.setTitleColor(.white, for: .normal)
        instance.titleLabel?.font = FontWeight(14, weight: .medium)
        instance.addTarget(self, action: #selector(didRight), for: .touchUpInside)
        return instance
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    func initUI() {
        addSubview(navView)
        addSubview(smallNavView)
        smallNavView.addSubview(navTitle)
        smallNavView.addSubview(backButton)
        smallNavView.addSubview(rightButton)
        
        navView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        smallNavView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(kStatusBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        navTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.width.height.equalTo(44)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    @objc func didBack() {
        if leftIsPop  == true {
//            currNavigationController().popViewController(animated: true)
        }else{
            leftBlock?()
        }
    }
    
    @objc func didRight(){
        rightBlock?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
