//
//  MeViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit

class MeViewController: UIViewController {
    
    /// 登录悬浮按钮
    var bubbleWindow : BMBubbleWindow?
    private lazy var bubbleBgView : UIView = {
        let instance = UIView.init(frame: CGRect(x: 200, y: 200, width: 68, height: 68+25))
        instance.backgroundColor = .yellow
        return instance
    }()
    private lazy var bubbleGiftBagIcon: UIImageView = {
        let instance = UIImageView()
        ///instance.loadGif(name: "guizumanghe")
        instance.image = UIImage.init(named: "home-hero-swift-hero")
        return instance
    }()
    
    
    
    private lazy var dragView : BMDragView = {
        let instance = BMDragView.init(frame: CGRect(x: ScreenWidth - MatchWCFloatingFunViewWidth - 10, y: ScreenHeight/2-MatchWCFloatingFunViewWidth/2, width: MatchWCFloatingFunViewWidth, height: MatchWCFloatingFunViewWidth))
        instance.freeRect = CGRect(x: 10, y: 100, width: ScreenWidth-10*2, height: ScreenHeight-100-30)
        instance.layer.cornerRadius = MatchWCFloatingFunViewWidth/2
        instance.layer.masksToBounds = true
        return instance
    }()
    lazy var dragBtnImgView: UIButton = {
        let instance = UIButton(type: .custom)
        instance.frame = CGRect(x: 0, y: 0, width: MatchWCFloatingFunViewWidth, height: MatchWCFloatingFunViewWidth)
        instance.setBackgroundImage(UIImage(named: "match_flo_button"), for: .normal)
        instance.addTarget(self, action: #selector(onDragBtmImgViewClicked), for: .touchUpInside)
        instance.isHidden = false
        return instance
    }()
    
    private lazy var dragBgView : UIImageView = {
        let instance = UIImageView()
        instance.image = UIImage(named: "match_flo_bg")
        instance.isUserInteractionEnabled = true
        instance.backgroundColor = .white
        instance.layer.cornerRadius = MatchWCFloatingFunViewWidth/2
        instance.layer.masksToBounds = true
        instance.isHidden = true
        return instance
    }()
    
    
   let btnHeight = (MatchWCFloatingFunViewHeight-10*2)/4
    private lazy var saishiButton: UIButton = {
        let instance = UIButton(type: .custom)
        instance.frame =  CGRect(x: 1, y: 10, width: MatchWCFloatingFunViewWidth, height: btnHeight)
        instance.setTitleColor(UIColor(hex: "333333"), for: .normal)
        instance.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
        instance.titleLabel?.font = FontWeight(14, weight: .regular)
        instance.set(image: UIImage(named: "match_saishi"), title: "赛事", titlePosition: .bottom, additionalSpacing: 8, state: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onFloatingButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    private lazy var jifenButton: UIButton = {
        let instance = UIButton(type: .custom)
        instance.frame =  CGRect(x: 1, y: 10+btnHeight, width: MatchWCFloatingFunViewWidth, height: btnHeight)
        instance.setTitleColor(UIColor(hex: "333333"), for: .normal)
        instance.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
        instance.titleLabel?.font = FontWeight(14, weight: .regular)
        instance.set(image: UIImage(named: "match_jifen"), title: "积分", titlePosition: .bottom, additionalSpacing: 8, state: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onFloatingButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    private lazy var jinjituButton: UIButton = {
        let instance = UIButton(type: .custom)
        instance.frame =  CGRect(x: 1, y: 10+btnHeight*2, width: MatchWCFloatingFunViewWidth, height: btnHeight)
        instance.setTitleColor(UIColor(hex: "333333"), for: .normal)
        instance.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
        instance.titleLabel?.font = FontWeight(14, weight: .regular)
        instance.set(image: UIImage(named: "match_jinjitu"), title: "晋级图", titlePosition: .bottom, additionalSpacing: 8, state: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onFloatingButtonClicked(_:)), for: .touchUpInside)
        return instance
    }()
    
    private lazy var jingcaiButton: UIButton = {
        let instance = UIButton(type: .custom)
        instance.frame =  CGRect(x: 1, y: 10+btnHeight*3, width: MatchWCFloatingFunViewWidth, height: btnHeight)
        instance.setTitleColor(UIColor(hex: "333333"), for: .normal)
        instance.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
        instance.titleLabel?.font = FontWeight(14, weight: .regular)
        instance.set(image: UIImage(named: "match_jingcai"), title: "竞猜", titlePosition: .bottom, additionalSpacing: 8, state: .normal)
        instance.tag = 3000
        instance.addTarget(self, action: #selector(onFloatingButtonClicked(_:)), for: .touchUpInside)
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
    
    private lazy var contentView : UIView = {
        let instance = UIView()
        instance.backgroundColor = .red
        return instance
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createFloatButtonUI()
        createDragView()
        
        createAdaptiveScrollViewUI()

//        createFixedSizeScrollViewUI()
    }
    
    
    /// 设定contentView大小
    func createFixedSizeScrollViewUI() {
        
//        scrollView.contentSize = CGSize(width: ScreenWidth, height: 2000)
        
        scrollView.backgroundColor = .green
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets.zero)
        }
        
        
        scrollView.addSubview(contentView)
        // 设置内容视图contentView的位置，需要设置6个约束，上下左右+宽高, 4个不行
        contentView.snp.makeConstraints { make in
            make.top.left.bottom.right.width.equalToSuperview() // 上下左右高度都跟scrollView一样
//            make.height.equalToSuperview().multipliedBy(2)  // 父控件的2倍
            make.height.equalTo(2000)
        }
        
        // 加2个视图 看滚动屏幕变化
        let bgBox = UIView(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        bgBox.backgroundColor = .purple
        contentView.addSubview(bgBox)
        
        let bgBox2 = UIView(frame: CGRect(x: 50, y: 2000-500, width: 200, height: 100))
        bgBox2.backgroundColor = .orange
        contentView.addSubview(bgBox2)
    }
        
    
    
    /// 根据内容自动撑大contentView大小
    func createAdaptiveScrollViewUI() {
        view.backgroundColor = .gray
        
        scrollView.backgroundColor = .brown
        contentView.backgroundColor = .red
        
        
        let image1 = UIView()
        let image2 = UIView()
        let stackView = UIStackView()
        
        image1.backgroundColor = .yellow
        image2.backgroundColor = .green

        stackView.axis = .vertical // 세로스크롤
//        stackView.axis = .horizontal // 가로스크롤
        stackView.distribution = .equalSpacing
        
        [image1, image2].forEach {
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(500)
            }
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)  // 安全区域 例如导航栏+tabbar
            $0.leading.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
    
    
    
    func createDragView() {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        
        // ***1***
        dragView.addSubview(dragBtnImgView)
        dragView.backgroundColor = UIColor.clear
        window?.addSubview(dragView)
        
        // ***2***
        dragBgView.frame = CGRect(x: 0, y: 0, width: MatchWCFloatingFunViewWidth, height: MatchWCFloatingFunViewHeight)
        dragView.addSubview(dragBgView)
        
        dragBgView.addSubview(saishiButton)
        dragBgView.addSubview(jifenButton)
        dragBgView.addSubview(jinjituButton)
        dragBgView.addSubview(jingcaiButton)
    }
    
    func createFloatButtonUI() {
        //            // 布局用到了snpKit，用的时候依据项目本身修改即可
        //            let floatButton = FloatButton(bgColor: UIColor.orange, titleOfButton: "测试")
        //            let firstWindow = UIApplication.shared.windows[0]
        //            firstWindow.addSubview(floatButton)
        //
        //            floatButton.singleClickCallback = { [weak self] in
        //                self?.singleClick()
        //            }
        //            floatButton.snp.makeConstraints { (make) in
        //                make.top.equalTo(80)
        //                make.left.equalTo(20)
        //                make.width.equalTo(80)
        //                make.height.equalTo(50)
        //            }
                
        //        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
                
        //        bubbleBgView.addSubview(bubbleGiftBagIcon)
        //        bubbleGiftBagIcon.frame = CGRect(x: 0, y: 0, width: 68, height: 68)
        //
        //        let bubbleCloseBtn = UIButton(type: .custom)
        //        bubbleCloseBtn.setBackgroundImage(UIImage(named: "live_bbclose"), for: .normal)
        //        bubbleCloseBtn.addTarget(self, action: #selector(bubbleCloseBtnClicked), for: .touchUpInside)
        //        bubbleBgView.addSubview(bubbleCloseBtn)
        //        bubbleCloseBtn.frame = CGRect(x: 68/2-20/2, y: 68+5, width: 20, height: 20)
        //
        //
        //        bubbleWindow = BMBubbleWindow(customView: bubbleBgView, margin: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), level: UIWindow.Level.alert+1,backBlock: {[weak self] in
        //            guard let strongSelf =  self else{
        //                return
        //            }
        //            //            strongSelf.jumpRegisterLogin()
        //        })
        //        bubbleWindow?.show()
        //        bubbleWindow?.positionY = 300
        //        bubbleWindow?.position = .Right
        //
        //        bubbleWindow?.backgroundColor = UIColor.red
    }
    
    
    @objc func onDragBtmImgViewClicked() {
        
        UIView.animate(withDuration: 0.5) {
            
            var frameX = ScreenWidth - MatchWCFloatingFunViewWidth - 10
            if self.dragView.frame.origin.x < ScreenWidth/2 {
                frameX = 10
            }
            self.dragView.frame = CGRect(x: frameX, y: ScreenHeight/2-MatchWCFloatingFunViewHeight/2, width: MatchWCFloatingFunViewWidth, height: MatchWCFloatingFunViewHeight)
        }
        dragBtnImgView.isHidden = true
        dragBgView.isHidden = false
        
    }
    
    @objc func onFloatingButtonClicked(_ sender: UIButton) {
        
        let tag = sender.tag - 3000

        UIView.animate(withDuration: 0.3) {
            var frameX = ScreenWidth - MatchWCFloatingFunViewWidth - 10
            if self.dragView.frame.origin.x < ScreenWidth/2 {
                frameX = 10
            }
            self.dragView.frame = CGRect(x: frameX, y: ScreenHeight/2-MatchWCFloatingFunViewWidth/2, width: MatchWCFloatingFunViewWidth, height: MatchWCFloatingFunViewWidth)
        
        }
        
        self.dragBtnImgView.isHidden = false
        self.dragBgView.isHidden = true
        
        
        switch tag {
        case 0:  // 赛事
            break
        case 1: // 积分
            break
        case 2: // 晋级图
            break
        case 3: // 竞猜
            break
        default:
            break
        }
        
    }
    
    @objc func bubbleCloseBtnClicked() {
        bubbleWindow?.hidden()
    }
    
    
    // 自定义block回调点击事件
    func singleClick() {
        debugPrint("点击事件调用Success!")
    }
    
    
    
    
    
}
