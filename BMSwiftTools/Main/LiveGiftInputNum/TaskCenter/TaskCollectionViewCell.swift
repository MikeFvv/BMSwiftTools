//
//  TaskCollectionViewCell.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/24/22.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {

    private lazy var iconImageView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_等级标签")
        instance.layer.cornerRadius  = 16
        instance.layer.masksToBounds = true
        return instance
    }()
    private lazy var lockIconView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_lock")
        instance.layer.cornerRadius  = 16
        instance.layer.masksToBounds = true
        return instance
    }()
    
    private lazy var nameLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    private lazy var desLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .black
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(lockIconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(desLabel)
    
        
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(5)
        }
        
        desLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        lockIconView.snp.makeConstraints { make in
            make.left.equalTo(desLabel.snp.left).offset(-5)
            make.centerY.equalTo(desLabel)
            make.width.height.equalTo(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            
//            contentView.layer.cornerRadius = isSelected ? 5 : 0
//            contentView.layer.masksToBounds =  isSelected ? true : false
//            contentView.layer.borderWidth = isSelected ? 2 : 0
//            contentView.layer.borderColor = isSelected ? RGB(r: 219, g: 178, b: 114).cgColor : nil
            
        }
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
}

