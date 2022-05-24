//
//  TaskTableViewCell.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/24/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private lazy var bgView : UIView = {
        let instance = UIView()
        instance.backgroundColor = .white
        instance.layer.cornerRadius = 8;
        instance.layer.masksToBounds = true
        return instance
    }()
    
    
    
    private lazy var titleLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    private lazy var markIconView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_新手")
        return instance
    }()
    private lazy var markLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    private lazy var expIconView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_expIcon")
        return instance
    }()
    private lazy var duyeIconView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_毒液")
        return instance
    }()
    
    
    private lazy var expLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    private lazy var duyeLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    private lazy var doneButton: UIButton = {
        let instance = UIButton(type: .custom)
        instance.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        instance.setTitle("--", for: .normal)
        instance.setTitleColor(.white, for: .normal)
        instance.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        instance.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)

        instance.addTarget(self, action: #selector(doneButtonButtonClicked), for: .touchUpInside)
        instance.layer.cornerRadius = 32/2
        instance.layer.masksToBounds = true
        return instance
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        createUI()
    }
    
    
    
    @objc func doneButtonButtonClicked() {
        
    }
    
    public func updateData(_ gift: TaskModel?) -> Self {
//        if let gift = gift {
//
//            if gift.icon.contains("http") {
//                iconImageView.sd_setImage(with: URL(string: gift.icon), placeholderImage: UIImage(named: "gift_placeholder"))
//            } else {
//                iconImageView.image = UIImage(named: gift.icon)
//            }
//
//            nameLabel.text = gift.gift_name
//            priceLabel.text = "\(gift.price)克拉"
//            diamondImageView.image = UIImage(named: "gift_diamond")
//            let broadcastGifts = ["7", "8"]
//            //            broadcastView.isHidden = !broadcastGifts.contains(gift.id)
//        } else {
//            iconImageView.image = nil
//            nameLabel.text = ""
//            priceLabel.text = ""
//            diamondImageView.image = nil
//            broadcastView.isHidden = true
//        }
        return self
    }
    
    
    func createUI() {
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.right.equalTo(contentView.snp.right).offset(-12)
            make.bottom.equalTo(contentView).offset(-0)
        }
        
        bgView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-12)
            make.size.equalTo(CGSize(width: 68, height: 32))
        }
        
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(12)
        }
        
        bgView.addSubview(markIconView)
        markIconView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.left.equalTo(titleLabel.snp.right).offset(10)
            make.size.equalTo(CGSize(width: 32, height: 17))
        }
        
//        markIconView.addSubview(markLabel)
//        markLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
        
        
        bgView.addSubview(expIconView)
        expIconView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        bgView.addSubview(expLabel)
        expLabel.snp.makeConstraints { make in
            make.left.equalTo(expIconView.snp.right).offset(2)
            make.centerY.equalTo(expIconView)
        }
        
        
        bgView.addSubview(duyeIconView)
        duyeIconView.snp.makeConstraints { make in
            make.left.equalTo(expLabel.snp.right).offset(20)
            make.centerY.equalTo(expIconView)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        bgView.addSubview(duyeLabel)
        duyeLabel.snp.makeConstraints { make in
            make.left.equalTo(duyeIconView.snp.right).offset(2)
            make.centerY.equalTo(duyeIconView)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


