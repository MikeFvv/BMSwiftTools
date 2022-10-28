//
//  MatchWCPromotionImageController.swift
//  venom
//
//  Created by BLOM on 10/8/22.
//  Copyright © 2022 Venom. All rights reserved.
//

import UIKit

class MatchWCPromotionImageController: UIViewController {
    
    private lazy var naviView: NavBarBlackBackCommonView = {
        let instance = NavBarBlackBackCommonView()
        instance.backgroundColor = .clear
        instance.smallNavView.backgroundColor = .clear
        instance.navTitle.text = "晋级图"
        instance.navTitle.textColor = .white
        instance.backButton.setImage(UIImage.init(named: "live_back_white"), for: .normal)
        return instance
    }()
    
    private lazy var scrollView: UIScrollView = {
        let instance = UIScrollView()
        //        instance.alwaysBounceVertical = true  // 开启竖直方向回弹效果
        //        instance.alwaysBounceHorizontal = true  // 开启水平方向回弹效果
        //        instance.showsVerticalScrollIndicator = false  // 显示竖直方向滚动条
        //        instance.showsHorizontalScrollIndicator = false // 显示水平方向滚动条
        //        view.bounds = true  // 是否可拉出空白区域
        //        instance.isPagingEnabled = true  // 开启自动定位分页效果
        
        if #available(iOS 11.0, *) {
            instance.contentInsetAdjustmentBehavior = .never
        }
        //        instance.delegate = self
        return instance
    }()
    
    private lazy var contentBgImgView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "match_晋级图")
        return instance
    }()
    
    // btn宽高
    let btnSize: CGFloat = 32
    
    
    // MARK: - ************ 奖杯 ************
    private lazy var trophyImgView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "match_卡塔尔奖杯")
        return instance
    }()
    private lazy var trophyLabel: UILabel = {
        let instance = UILabel()
        instance.text = "12/18"
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    private lazy var trophyLeftBtn: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var trophyRightBtn: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var trophyLeftLabel: UILabel = {
        let instance = UILabel()
        instance.text = "第4场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var trophyRightLabel: UILabel = {
        let instance = UILabel()
        instance.text = "第2场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    
    // MARK: - ************ 奖杯上面 ************
    private lazy var topBtn1: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel1: UILabel = {
        let instance = UILabel()
        instance.text = "第2场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topBtn2: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel2: UILabel = {
        let instance = UILabel()
        instance.text = "第1场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topBtn3: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel3: UILabel = {
        let instance = UILabel()
        instance.text = "第1场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topBtn4: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel4: UILabel = {
        let instance = UILabel()
        instance.text = "第2场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topBtn5: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel5: UILabel = {
        let instance = UILabel()
        instance.text = "第5场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topBtn6: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topLabel6: UILabel = {
        let instance = UILabel()
        instance.text = "第6场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    
    // top8个按钮
    private lazy var topEBtn1: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn2: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn3: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn4: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn5: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn6: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn7: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var topEBtn8: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    private lazy var topELabel1: UILabel = {
        let instance = UILabel()
        instance.text = "A1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel2: UILabel = {
        let instance = UILabel()
        instance.text = "B2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel3: UILabel = {
        let instance = UILabel()
        instance.text = "C1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel4: UILabel = {
        let instance = UILabel()
        instance.text = "D2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel5: UILabel = {
        let instance = UILabel()
        instance.text = "E1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel6: UILabel = {
        let instance = UILabel()
        instance.text = "F2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel7: UILabel = {
        let instance = UILabel()
        instance.text = "G1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topELabel8: UILabel = {
        let instance = UILabel()
        instance.text = "H2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    
    
    
    
    
    private lazy var topDateLabel1: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel2: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel3: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel4: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel5: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel6: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var topDateLabel7: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    // MARK: - ************ 奖杯下面 ************
    private lazy var bottomBtn1: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel1: UILabel = {
        let instance = UILabel()
        instance.text = "第4场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomBtn2: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel2: UILabel = {
        let instance = UILabel()
        instance.text = "第3场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomBtn3: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel3: UILabel = {
        let instance = UILabel()
        instance.text = "第4场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomBtn4: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel4: UILabel = {
        let instance = UILabel()
        instance.text = "第3场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomBtn5: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel5: UILabel = {
        let instance = UILabel()
        instance.text = "第4场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomBtn6: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomLabel6: UILabel = {
        let instance = UILabel()
        instance.text = "第3场..."
        instance.textColor = .white
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    
    
    // bottom8个按钮
    private lazy var bottomEBtn1: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn2: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn3: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn4: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn5: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn6: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    private lazy var bottomEBtn7: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    private lazy var bottomEBtn8: UIButton = {
        let instance = UIButton(type: .custom)
        instance.setBackgroundImage(UIImage(named: "match_temp_default"), for: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onTeamInfButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    
    
    private lazy var bottomELabel1: UILabel = {
        let instance = UILabel()
        instance.text = "B1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomELabel2: UILabel = {
        let instance = UILabel()
        instance.text = "A2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomELabel3: UILabel = {
        let instance = UILabel()
        instance.text = "D1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomELabel4: UILabel = {
        let instance = UILabel()
        instance.text = "C2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    
    private lazy var bottomELabel5: UILabel = {
        let instance = UILabel()
        instance.text = "F1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomELabel6: UILabel = {
        let instance = UILabel()
        instance.text = "E2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    
    private lazy var bottomELabel7: UILabel = {
        let instance = UILabel()
        instance.text = "H1"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomELabel8: UILabel = {
        let instance = UILabel()
        instance.text = "G2"
        instance.textColor = .white
        instance.font = FontWeight(12, weight: .regular)
        instance.textAlignment = .center
        return instance
    }()
    
    
    
    
    private lazy var bottomDateLabel1: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel2: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel3: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel4: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel5: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel6: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    private lazy var bottomDateLabel7: UILabel = {
        let instance = UILabel()
        instance.text = "-/-"
        instance.textColor = UIColor(hex: "FFD666")
        instance.font = FontWeight(14, weight: .medium)
        instance.textAlignment = .center
        return instance
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "F6F6F6")
        
        createUI()
    }
    
    lazy var imgView: UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "defaultavatar")
        //    instance.layer.cornerRadius  = 5
        //    instance.layer.masksToBounds = true
        
        return instance
    }()
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    @objc func onTeamInfButtonClicked(_ sender: UIButton) {
        let tag = sender.tag - 3000
        
        
    }
    
    
    // MARK: - 创建视图
    func createUI() {
        
        createFixedSizeScrollViewUI()
        initNav()
        
        
        contentBgImgView.addSubview(trophyImgView)
        trophyImgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        contentBgImgView.addSubview(trophyLabel)
        trophyLabel.snp.makeConstraints { make in
            make.top.equalTo(trophyImgView.snp.bottom).offset(2)
            make.centerX.equalTo(trophyImgView)
        }
        
        
        contentBgImgView.addSubview(trophyLeftBtn)
        trophyLeftBtn.snp.makeConstraints { make in
            make.centerY.equalTo(trophyImgView)
            make.right.equalTo(trophyImgView.snp.left).offset(-45)
        }
        contentBgImgView.addSubview(trophyLeftLabel)
        trophyLeftLabel.snp.makeConstraints { make in
            make.top.equalTo(trophyLeftBtn.snp.bottom).offset(2)
            make.centerX.equalTo(trophyLeftBtn)
        }
        
        contentBgImgView.addSubview(trophyRightBtn)
        trophyRightBtn.snp.makeConstraints { make in
            make.centerY.equalTo(trophyImgView)
            make.left.equalTo(trophyImgView.snp.right).offset(45)
        }
        contentBgImgView.addSubview(trophyRightLabel)
        trophyRightLabel.snp.makeConstraints { make in
            make.top.equalTo(trophyRightBtn.snp.bottom).offset(2)
            make.centerX.equalTo(trophyRightBtn)
        }
        
        createBottomUI()
        createTopUI()
        
    }
    
    func initNav() {
        view.addSubview(naviView)
        naviView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(kNavigationFullHeight)
        }
    }
    
    /// 设定contentBgImgView大小
    func createFixedSizeScrollViewUI() {
        
        //        scrollView.contentSize = CGSize(width: ScreenWidth, height: 2000)
        
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets.zero)
        }
        
        
        scrollView.addSubview(contentBgImgView)
        contentBgImgView.snp.makeConstraints { make in
            make.top.left.bottom.right.width.equalToSuperview()
            make.height.equalTo(927)
        }
    }
    
    
    func createTopUI() {
        let topLineImg1 = UIImageView()
        topLineImg1.image = UIImage(named: "match_大_上")
        contentBgImgView.addSubview(topLineImg1)
        topLineImg1.snp.makeConstraints { make in
            make.centerX.equalTo(trophyImgView.snp.centerX)
            make.bottom.equalTo(trophyImgView.snp.top).offset(-5)
        }
        
        contentBgImgView.addSubview(topBtn1)
        topBtn1.snp.makeConstraints { make in
            make.centerX.equalTo(trophyLeftBtn.snp.centerX)
            make.bottom.equalTo(trophyLeftBtn.snp.top).offset(-64)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel1)
        topLabel1.snp.makeConstraints { make in
            make.bottom.equalTo(topBtn1.snp.top).offset(-2)
            make.centerX.equalTo(topBtn1)
        }
         
        contentBgImgView.addSubview(topBtn2)
        topBtn2.snp.makeConstraints { make in
            make.centerX.equalTo(trophyRightBtn.snp.centerX)
            make.bottom.equalTo(trophyRightBtn.snp.top).offset(-64)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel2)
        topLabel2.snp.makeConstraints { make in
            make.bottom.equalTo(topBtn2.snp.top).offset(-2)
            make.centerX.equalTo(topBtn2)
        }
        
        
        
        let topLineImg2 = UIImageView()
        topLineImg2.image = UIImage(named: "match_中_上")
        contentBgImgView.addSubview(topLineImg2)
        topLineImg2.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn1.snp.centerX)
            make.bottom.equalTo(topLabel1.snp.top).offset(-5)
        }
        let topLineImg3 = UIImageView()
        topLineImg3.image = UIImage(named: "match_中_上")
        contentBgImgView.addSubview(topLineImg3)
        topLineImg3.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn2.snp.centerX)
            make.bottom.equalTo(topLabel2.snp.top).offset(-5)
        }
        
        
        
        
        contentBgImgView.addSubview(topBtn3)
        topBtn3.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg2.snp.left)
            make.bottom.equalTo(topBtn1.snp.top).offset(-75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel3)
        topLabel3.snp.makeConstraints { make in
            make.bottom.equalTo(topBtn3.snp.top).offset(-2)
            make.centerX.equalTo(topBtn3)
        }
        
        
        contentBgImgView.addSubview(topBtn4)
        topBtn4.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg2.snp.right)
            make.centerY.equalTo(topBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel4)
        topLabel4.snp.makeConstraints { make in
            make.centerY.equalTo(topLabel3.snp.centerY)
            make.centerX.equalTo(topBtn4)
        }
        
        contentBgImgView.addSubview(topBtn5)
        topBtn5.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg3.snp.left)
            make.centerY.equalTo(topBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel5)
        topLabel5.snp.makeConstraints { make in
            make.centerY.equalTo(topLabel3.snp.centerY)
            make.centerX.equalTo(topBtn5)
        }
        
        contentBgImgView.addSubview(topBtn6)
        topBtn6.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg3.snp.right)
            make.centerY.equalTo(topBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topLabel6)
        topLabel6.snp.makeConstraints { make in
            make.centerY.equalTo(topLabel3.snp.centerY)
            make.centerX.equalTo(topBtn6)
        }
        
        let topLineImg4 = UIImageView()
        topLineImg4.image = UIImage(named: "match_小_上")
        contentBgImgView.addSubview(topLineImg4)
        topLineImg4.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn3.snp.centerX)
            make.bottom.equalTo(topLabel3.snp.top).offset(-5)
        }
        let topLineImg5 = UIImageView()
        topLineImg5.image = UIImage(named: "match_小_上")
        contentBgImgView.addSubview(topLineImg5)
        topLineImg5.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn4.snp.centerX)
            make.centerY.equalTo(topLineImg4.snp.centerY)
        }
        let topLineImg6 = UIImageView()
        topLineImg6.image = UIImage(named: "match_小_上")
        contentBgImgView.addSubview(topLineImg6)
        topLineImg6.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn5.snp.centerX)
            make.centerY.equalTo(topLineImg4.snp.centerY)
        }
        let topLineImg7 = UIImageView()
        topLineImg7.image = UIImage(named: "match_小_上")
        contentBgImgView.addSubview(topLineImg7)
        topLineImg7.snp.makeConstraints { make in
            make.centerX.equalTo(topBtn6.snp.centerX)
            make.centerY.equalTo(topLineImg4.snp.centerY)
        }
        
        contentBgImgView.addSubview(topEBtn1)
        topEBtn1.snp.makeConstraints { make in
            make.right.equalTo(topBtn3.snp.centerX).offset(-5)
            make.bottom.equalTo(topBtn3.snp.top).offset(-75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel1)
        topELabel1.snp.makeConstraints { make in
            make.bottom.equalTo(topEBtn1.snp.top).offset(-2)
            make.centerX.equalTo(topEBtn1)
        }


        contentBgImgView.addSubview(topEBtn2)
        topEBtn2.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.left.equalTo(topBtn3.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel2)
        topELabel2.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn2)
        }

        contentBgImgView.addSubview(topEBtn3)
        topEBtn3.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.right.equalTo(topBtn4.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel3)
        topELabel3.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn3)
        }

        contentBgImgView.addSubview(topEBtn4)
        topEBtn4.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.left.equalTo(topBtn4.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel4)
        topELabel4.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn4)
        }

        contentBgImgView.addSubview(topEBtn5)
        topEBtn5.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.right.equalTo(topBtn5.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel5)
        topELabel5.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn5)
        }

        contentBgImgView.addSubview(topEBtn6)
        topEBtn6.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.left.equalTo(topBtn5.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel6)
        topELabel6.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn6)
        }


        contentBgImgView.addSubview(topEBtn7)
        topEBtn7.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.right.equalTo(topBtn6.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel7)
        topELabel7.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn7)
        }

        contentBgImgView.addSubview(topEBtn8)
        topEBtn8.snp.makeConstraints { make in
            make.centerY.equalTo(topEBtn1.snp.centerY)
            make.left.equalTo(topBtn6.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(topELabel8)
        topELabel8.snp.makeConstraints { make in
            make.centerY.equalTo(topELabel1.snp.centerY)
            make.centerX.equalTo(topEBtn8)
        }
        
        
        
        
        // ************* top日期 *************
        contentBgImgView.addSubview(topDateLabel1)
        topDateLabel1.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg1.snp.centerX)
            make.bottom.equalTo(topLineImg1.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel2)
        topDateLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg2.snp.centerX)
            make.bottom.equalTo(topLineImg2.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel3)
        topDateLabel3.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg3.snp.centerX)
            make.bottom.equalTo(topLineImg3.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel4)
        topDateLabel4.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg4.snp.centerX)
            make.bottom.equalTo(topLineImg4.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel5)
        topDateLabel5.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg5.snp.centerX)
            make.bottom.equalTo(topLineImg5.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel6)
        topDateLabel6.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg6.snp.centerX)
            make.bottom.equalTo(topLineImg6.snp.bottom).offset(-20)
        }
        contentBgImgView.addSubview(topDateLabel7)
        topDateLabel7.snp.makeConstraints { make in
            make.centerX.equalTo(topLineImg7.snp.centerX)
            make.bottom.equalTo(topLineImg7.snp.bottom).offset(-20)
        }
        
        
    }
    
    
    func createBottomUI() {
        let bottomLineImg1 = UIImageView()
        bottomLineImg1.image = UIImage(named: "match_大_下")
        contentBgImgView.addSubview(bottomLineImg1)
        bottomLineImg1.snp.makeConstraints { make in
            make.centerX.equalTo(trophyImgView.snp.centerX)
            make.top.equalTo(trophyLabel.snp.bottom).offset(5)
        }
        
        contentBgImgView.addSubview(bottomBtn1)
        bottomBtn1.snp.makeConstraints { make in
            make.centerX.equalTo(trophyLeftBtn.snp.centerX)
            make.top.equalTo(trophyLeftBtn.snp.bottom).offset(75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel1)
        bottomLabel1.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn1.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn1)
        }
         
        contentBgImgView.addSubview(bottomBtn2)
        bottomBtn2.snp.makeConstraints { make in
            make.centerX.equalTo(trophyRightBtn.snp.centerX)
            make.top.equalTo(trophyRightBtn.snp.bottom).offset(75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel2)
        bottomLabel2.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn2.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn2)
        }
        
        let bottomLineImg2 = UIImageView()
        bottomLineImg2.image = UIImage(named: "match_中_下")
        contentBgImgView.addSubview(bottomLineImg2)
        bottomLineImg2.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn1.snp.centerX)
            make.top.equalTo(bottomLabel1.snp.bottom).offset(5)
        }
        let bottomLineImg3 = UIImageView()
        bottomLineImg3.image = UIImage(named: "match_中_下")
        contentBgImgView.addSubview(bottomLineImg3)
        bottomLineImg3.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn2.snp.centerX)
            make.top.equalTo(bottomLabel2.snp.bottom).offset(5)
        }
        
        
        contentBgImgView.addSubview(bottomBtn3)
        bottomBtn3.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg2.snp.left)
            make.top.equalTo(bottomBtn1.snp.bottom).offset(75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel3)
        bottomLabel3.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn3.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn3)
        }
        
        
        contentBgImgView.addSubview(bottomBtn4)
        bottomBtn4.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg2.snp.right)
            make.centerY.equalTo(bottomBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel4)
        bottomLabel4.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn4.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn4)
        }
        
        contentBgImgView.addSubview(bottomBtn5)
        bottomBtn5.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg3.snp.left)
            make.centerY.equalTo(bottomBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel5)
        bottomLabel5.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn5.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn5)
        }
        
        contentBgImgView.addSubview(bottomBtn6)
        bottomBtn6.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg3.snp.right)
            make.centerY.equalTo(bottomBtn3.snp.centerY)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomLabel6)
        bottomLabel6.snp.makeConstraints { make in
            make.top.equalTo(bottomBtn6.snp.bottom).offset(2)
            make.centerX.equalTo(bottomBtn6)
        }
        
        let bottomLineImg4 = UIImageView()
        bottomLineImg4.image = UIImage(named: "match_小_下")
        contentBgImgView.addSubview(bottomLineImg4)
        bottomLineImg4.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn3.snp.centerX)
            make.top.equalTo(bottomLabel3.snp.bottom).offset(5)
        }
        let bottomLineImg5 = UIImageView()
        bottomLineImg5.image = UIImage(named: "match_小_下")
        contentBgImgView.addSubview(bottomLineImg5)
        bottomLineImg5.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn4.snp.centerX)
            make.top.equalTo(bottomLabel4.snp.bottom).offset(5)
        }
        let bottomLineImg6 = UIImageView()
        bottomLineImg6.image = UIImage(named: "match_小_下")
        contentBgImgView.addSubview(bottomLineImg6)
        bottomLineImg6.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn5.snp.centerX)
            make.top.equalTo(bottomLabel5.snp.bottom).offset(5)
        }
        let bottomLineImg7 = UIImageView()
        bottomLineImg7.image = UIImage(named: "match_小_下")
        contentBgImgView.addSubview(bottomLineImg7)
        bottomLineImg7.snp.makeConstraints { make in
            make.centerX.equalTo(bottomBtn6.snp.centerX)
            make.top.equalTo(bottomLabel6.snp.bottom).offset(5)
        }
        
        contentBgImgView.addSubview(bottomEBtn1)
        bottomEBtn1.snp.makeConstraints { make in
            make.right.equalTo(bottomBtn3.snp.centerX).offset(-5)
            make.top.equalTo(bottomBtn3.snp.bottom).offset(75)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel1)
        bottomELabel1.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn1.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn1)
        }
        
        
        contentBgImgView.addSubview(bottomEBtn2)
        bottomEBtn2.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.left.equalTo(bottomBtn3.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel2)
        bottomELabel2.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn2.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn2)
        }
        
        contentBgImgView.addSubview(bottomEBtn3)
        bottomEBtn3.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.right.equalTo(bottomBtn4.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel3)
        bottomELabel3.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn3.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn3)
        }
        
        contentBgImgView.addSubview(bottomEBtn4)
        bottomEBtn4.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.left.equalTo(bottomBtn4.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel4)
        bottomELabel4.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn4.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn4)
        }
        
        contentBgImgView.addSubview(bottomEBtn5)
        bottomEBtn5.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.right.equalTo(bottomBtn5.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel5)
        bottomELabel5.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn5.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn5)
        }

        contentBgImgView.addSubview(bottomEBtn6)
        bottomEBtn6.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.left.equalTo(bottomBtn5.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel6)
        bottomELabel6.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn6.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn6)
        }


        contentBgImgView.addSubview(bottomEBtn7)
        bottomEBtn7.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.right.equalTo(bottomBtn6.snp.centerX).offset(-5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel7)
        bottomELabel7.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn7.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn7)
        }

        contentBgImgView.addSubview(bottomEBtn8)
        bottomEBtn8.snp.makeConstraints { make in
            make.centerY.equalTo(bottomEBtn1.snp.centerY)
            make.left.equalTo(bottomBtn6.snp.centerX).offset(5)
            make.size.equalTo(btnSize)
        }
        contentBgImgView.addSubview(bottomELabel8)
        bottomELabel8.snp.makeConstraints { make in
            make.top.equalTo(bottomEBtn8.snp.bottom).offset(2)
            make.centerX.equalTo(bottomEBtn8)
        }
        
        
        
        
        // ************* bottom日期 *************
        contentBgImgView.addSubview(bottomDateLabel1)
        bottomDateLabel1.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg1.snp.centerX)
            make.top.equalTo(bottomLineImg1.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel2)
        bottomDateLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg2.snp.centerX)
            make.top.equalTo(bottomLineImg2.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel3)
        bottomDateLabel3.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg3.snp.centerX)
            make.top.equalTo(bottomLineImg3.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel4)
        bottomDateLabel4.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg4.snp.centerX)
            make.top.equalTo(bottomLineImg4.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel5)
        bottomDateLabel5.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg5.snp.centerX)
            make.top.equalTo(bottomLineImg5.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel6)
        bottomDateLabel6.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg6.snp.centerX)
            make.top.equalTo(bottomLineImg6.snp.top).offset(20)
        }
        contentBgImgView.addSubview(bottomDateLabel7)
        bottomDateLabel7.snp.makeConstraints { make in
            make.centerX.equalTo(bottomLineImg7.snp.centerX)
            make.top.equalTo(bottomLineImg7.snp.top).offset(20)
        }
        
    }
    
}



extension MatchWCPromotionImageController: UIScrollViewDelegate {
    
    //    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    ////        return containerView
    //    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        //        let offsetX = (scrollView.frame.width > scrollView.contentSize.width) ? (scrollView.frame.width - scrollView.contentSize.width) * 0.5 : 0
        //        let offsetY = (scrollView.frame.height > scrollView.contentSize.height) ? (scrollView.frame.height - scrollView.contentSize.height) * 0.5 : 0
        //        containerView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //        resumeGif()
    }
    
}
