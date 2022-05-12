//
//  KeyBoardCell.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/11/22.
//

import UIKit

final class KeyBoardCell: UICollectionViewCell {
    private lazy var iconImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor("eeeeee").cgColor
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        
        iconImageView.isHidden = true
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            
        }
    }
    
    public func updateData(_ string: String?) -> Void {
        if let str = string {
            
            if str == "image" {
                iconImageView.isHidden = false
                titleLabel.isHidden = true
                iconImageView.image = UIImage(named: str)
            } else {
                iconImageView.isHidden = true
                titleLabel.isHidden = false
                titleLabel.text = str
            }
        }
    }
}
