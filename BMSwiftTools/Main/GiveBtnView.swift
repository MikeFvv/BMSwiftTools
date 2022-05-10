//
//  GiveBtnView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.
//

import UIKit


protocol GiveBtnViewDelegate: NSObjectProtocol {
    func giveBtnClick()
}



class GiveBtnView: UIView {

    weak var delegate: GiveBtnViewDelegate?
    
    private lazy var giveBtn: UIButton = {
        let instance = UIButton(type: .custom)
        instance.backgroundColor = RGB(r: 2, g: 168, b: 162)
        //        instance.semanticContentAttribute = .forceRightToLeft
        //        instance.setImage(RCSCAsset.Images.room.image, for: .normal)
        //        instance.adjustsImageWhenHighlighted = false
        instance.setTitle("赠送", for: .normal)
        instance.setTitleColor(.white, for: .normal)
        instance.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        instance.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        //        instance.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
//        instance.setBackgroundImage(sendGiftButtonBackgroundImage(), for: .normal)
        instance.addTarget(self, action: #selector(giveBtnClicked(_:)), for: .touchUpInside)
        
        instance.layer.cornerRadius = self.bounds.height
        instance.layer.masksToBounds = true
        return instance
    }()
  
    
    lazy var arrowView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "live_icon_arrow")
        return instance
    }()
    
    private lazy var numLabel: UILabel = {
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
    
    
    @objc private func giveBtnClicked(_ sender: UIButton) {
        delegate?.giveBtnClick()
    }
    
    
    func createUI() {
        backgroundColor = .yellow
        
        
        addSubview(giveBtn)
        giveBtn.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
        
        addSubview(arrowView)
        arrowView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
        
        
        addSubview(numLabel)
        numLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(20)
            make.trailing.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
