//
//  TaskCenterHeaderView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/24/22.
//

import UIKit

class TaskHeaderView: UIView {
    
    private lazy var topVipBgImgView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_level_1-5")
        instance.layer.cornerRadius  = 8
        instance.layer.masksToBounds = true
        return instance
    }()
    
    private lazy var vipLevelBgView : UIView = {
        let instance = UIView()
        instance.backgroundColor = .green
        instance.layer.cornerRadius = 8
        instance.layer.masksToBounds = true
        return instance
    }()
    
    
    
    
    private lazy var userAvatarImgView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "tc_level_1-5")
        return instance
    }()
    
    private lazy var levelIconView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "LV1")
        return instance
    }()
    
    private lazy var nameLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .white
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    private lazy var levelNumLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .white
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    private lazy var levelProgressView: UIProgressView = {
        let instance = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        instance.progress = 0.3
        // 设置已走过的进度条颜色
        instance.progressTintColor = .green
        // 设置未走过的进度条颜色
        instance.trackTintColor = .gray
//        // 设置的已走过进度的进度条图片
//        instance.progressImage = UIImage(named: "left-progress")
//        // 设置的未走过进度的进度条图片
//        instance.trackImage = UIImage(named: "right-progress")
        
        return instance
    }()
    
    private lazy var desLabel: UILabel = {
        let instance = UILabel()
        instance.text = "--"
        instance.textColor = .white
        instance.font = .systemFont(ofSize: 13)
        return instance
    }()
    
    private lazy var taskLevelView: TaskLevelCollectionView = {
        let instance = TaskLevelCollectionView()
        return instance
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("NewsDetailsTextHeaderView dealloc")
    }
    
    private func setupUI(){
        addSubview(topVipBgImgView)
        addSubview(vipLevelBgView)
        
        topVipBgImgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(130)
        }
        topVipBgImgView.addSubview(levelIconView)
        levelIconView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-36)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 144/2, height: 144/2))
        }
        
        
        topVipBgImgView.addSubview(userAvatarImgView)
        userAvatarImgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(16)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        topVipBgImgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(userAvatarImgView.snp.right).offset(10)
            make.centerY.equalTo(userAvatarImgView)
        }
        
        topVipBgImgView.addSubview(levelNumLabel)
        levelNumLabel.snp.makeConstraints { make in
            make.left.equalTo(userAvatarImgView)
            make.centerY.equalToSuperview()
        }
        
        topVipBgImgView.addSubview(levelProgressView)
        levelProgressView.snp.makeConstraints { make in
            make.top.equalTo(levelNumLabel.snp.bottom).offset(10)
            make.left.equalTo(userAvatarImgView)
            make.height.equalTo(5)
            make.width.equalTo((ScreenWidth-12*3)*0.5)
        }
        
        topVipBgImgView.addSubview(desLabel)
        desLabel.snp.makeConstraints { make in
            make.left.equalTo(userAvatarImgView)
            make.top.equalTo(levelProgressView.snp.bottom).offset(10)
        }
        
        
        
        
        
        
        vipLevelBgView.snp.makeConstraints { (make) in
            make.left.equalTo(topVipBgImgView.snp.left)
            make.right.equalTo(topVipBgImgView.snp.right)
            make.top.equalTo(topVipBgImgView.snp.bottom).offset(12)
            make.height.equalTo(260)
        }
        let titLabel = UILabel()
        titLabel.text = "等级特权"
        titLabel.textColor = .black
        titLabel.font = .systemFont(ofSize: 16, weight: .medium)
        // 与上面分开
        vipLevelBgView.addSubview(titLabel)
        titLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
        }

        vipLevelBgView.addSubview(taskLevelView)
        taskLevelView.snp.makeConstraints { (make) in
            make.top.equalTo(titLabel.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        
    }
}

