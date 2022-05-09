//
//  CodeBlockExample.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/12/22.
//

import UIKit
import Foundation


/// <#xxx属性 #">


// ❌错误
// ⚠️❗️警告
// 🔴⭕️注意

❌⚠️✔️ ❗️⭕️ 🔴



// MARK: - Some flags




class CodeBlockExample {
    
    // MARK: - 属性创建及初始化
    // 创建数组
    var array1: [Int] = []  // []
    var arrya2: Array<Int> = [1, 2, 3] // [1, 2, 3]
    var arryaInt = [1, 2, 3]  // [1, 2, 3]
    var array3 = Array(arrayLiteral: 1, 2, 3) // [1, 2, 3]
    lazy var statusList = [NSString]() // ?
    /// title数组
    open var titles = [String]()
    open var dataSource = [JXSegmentedBaseItemModel]()
    open var itemModel: JXSegmentedBaseItemModel?
    
    open var index: Int = 0
    open var isSelected: Bool = false
    open var itemWidth: CGFloat = 0
    
    var name: String { get }
    var type: Any.Type { get }
    var kind: Kind { get }
    var layout: UnsafeMutablePointer<InnerLayout>! { get }
    
    /// 如果将JXSegmentedView嵌套进UITableView的cell，每次重用的时候，JXSegmentedView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该闭包方法返回给JXSegmentedView。
    open var widthForTitleClosure: ((String)->(CGFloat))?
    private var currentImageInfo: String?
    
    
    /// 指示器视图Frame转换到cell
    open var indicatorConvertToItemFrame: CGRect = CGRect.zero
    open var dotSize = CGSize(width: 10, height: 10)
    open var dotOffset: CGPoint = CGPoint.zero
    
    
    open var lineStyle: JXSegmentedIndicatorLineStyle = .normal
    
    open var image: UIImage? {
        didSet {
            layer.contents = image?.cgImage
        }
    }
    
    open private(set) weak var dataSource: JXSegmentedListContainerViewDataSource?
    open private(set) var validListDict = [Int:JXSegmentedListContainerViewListDelegate]()
    open var defaultSelectedIndex: Int = 0 {
        didSet {
            currentIndex = defaultSelectedIndex
        }
    }
    
    
    
    
    public let selectedLineView: UIView = UIView()
    open var dotView = UIView()
    
    open var titleNormalColor: UIColor = .black
    open var dotColor = UIColor.red
    open private(set) var scrollView: UIScrollView!
    private var path = UIBezierPath()
    open var titleLabel = UILabel()
    public let titleLabel = UILabel()
    public let maskTitleLabel = UILabel()
    public let titleMaskLayer = CALayer()
    public let maskTitleMaskLayer = CALayer()
    open var titleNormalFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    
    
//    需要再init 初始化
    public let currentSelectedIndex: Int
    public let currentSelectedItemFrame: CGRect
    public let selectedType: JXSegmentedViewItemSelectedType
    public let currentItemContentWidth: CGFloat
    
    
    
    
    guard let itemModel = itemModel as? JXSegmentedTitleGradientItemModel else {
        return
    }
    
    
    
    
    // MARK: - 创建视图
    
    let lineView = UIView()
    lineView.backgroundColor = .red
    contentView.addSubview(lineView)
    lineView.snp.makeConstraints { make in
        make.left.equalTo(12)
        make.right.equalTo(-12)
        make.height.equalTo(1)
        make.bottom.equalTo(0)
    }
    
    let bgBox = UIView()
    bgBox.backgroundColor = .green
    superview.addSubview(bgBox)

    bgBox.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(superview).offset(20)
        make.left.equalTo(superview).offset(20)
        make.bottom.equalTo(superview).offset(-20)
        make.right.equalTo(superview).offset(-20)
    }
    
    lazy var playerView: UIView = {
       let _playerView = UIView()
        _playerView.backgroundColor = .red
        
        _playerView.frame = CGRect(x: 0, y: 44 + UIApplication.shared.statusBarFrame.size.height, width: self.view.bounds.width, height: self.view.bounds.height * 9 / 16)
        return _playerView
    }()
    
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.textColor = .white
        label.text = NSLocalizedString("Lorem ipsum dolor sit amet", comment: "")
        return label
    }()
    
    // 与上面分开
    label.snp.makeConstraints { make in
        make.top.equalTo(contentView).inset(20)
        make.leading.equalTo(contentView).inset(20)
        make.trailing.equalTo(contentView).inset(20)
        make.bottom.equalTo(contentView).inset(20)
    }
    
    private lazy var nextBtn : UIButton = {
        let _nextBtn = UIButton()
        _nextBtn.setTitle("下一篇", for: .normal)
        _nextBtn.setTitleColor(.white, for: .normal)
        _nextBtn.backgroundColor = RGB(r: 219, g: 178, b: 114)
        _nextBtn.titleLabel?.font = UIFont.pingFangRegular(14)
        //            _nextBtn.setImage(UIImage(named: "1582"), for: .normal)
        _nextBtn.adjustsImageWhenHighlighted = false
        
        //            let space = 3.0
        //        _nextBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //            _nextBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -space, bottom: 0, right: space)
        //            _nextBtn.imageView?.contentMode = .scaleAspectFit
        _nextBtn.addTarget(self,
                          action: #selector(nextBtnClick),
                          for: .touchUpInside)
        _nextBtn.frame = CGRect(x: 50, y: 80, width: 150, height: 50)
        
        return _nextBtn
    }()
    
        
    lazy var playerView: UIView = {
       let _playerView = UIView()
        _playerView.backgroundColor = .red
        
        _playerView.frame = CGRect(x: 0, y: 44 + UIApplication.shared.statusBarFrame.size.height, width: self.view.bounds.width, height: self.view.bounds.height * 9 / 16)
        return _playerView
    }()
    
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius  = 16
        imgView.layer.masksToBounds = true
        imgView.image = UIImage(named: "defaultavatar")
        return imgView
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        
        tableView.tableFooterView = UIView()
        
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 44;
        tableView.register(NewsRecommendTableViewCell.self, forCellReuseIdentifier: NewsRecommendTableViewCell.reuseId)
        
        return tableView
    }()
    
    
    fileprivate lazy var collectionView: UICollectionView = {
        let rect = CGRect(x: 0, y: 44 + UIApplication.shared.statusBarFrame.size.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 44 - UIApplication.shared.statusBarFrame.size.height)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: rect.width, height: rect.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let _collectiobView = UICollectionView(frame: rect, collectionViewLayout: layout)
        _collectiobView.backgroundColor = .white
        _collectiobView.isPagingEnabled = true
        _collectiobView.contentSize = CGSize(width: rect.width * 10.0, height: rect.height)
        _collectiobView.register(UINib(nibName: "GCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GCollectionViewCell")
        _collectiobView.dataSource = self
        _collectiobView.delegate = self
        return _collectiobView
    }()
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { (make) in
        make.left.right.bottom.equalToSuperview()
        make.top.equalToSuperview().offset(HZCustomNavigationBar.statusNavigationBarHeight)
    }
    
    
    
    let scrollView  = UIScrollView()
    let contentView = UIView()
    
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { make in
        make.edges.equalTo(view).inset(UIEdgeInsets.zero)
    }
    
    contentView.backgroundColor = UIColor.lightGray
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { make in
        make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
        make.width.equalTo(scrollView)
    }
    
    
    
    
    
    // MARK: - cell赋值方法
    open override func reloadData(itemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        super.reloadData(itemModel: itemModel, selectedType: selectedType )

        guard let myItemModel = itemModel as? JXSegmentedTitleAttributeItemModel else {
            return
        }

        titleLabel.numberOfLines = myItemModel.titleNumberOfLines
        if myItemModel.isSelected && myItemModel.selectedAttributedTitle != nil {
            titleLabel.attributedText = myItemModel.selectedAttributedTitle
        }else {
            titleLabel.attributedText = myItemModel.attributedTitle
        }
    }
    
    
    open override func preferredRefreshItemModel(_ itemModel: JXSegmentedBaseItemModel, at index: Int, selectedIndex: Int) {
        super.preferredRefreshItemModel(itemModel, at: index, selectedIndex: selectedIndex)

        guard let itemModel = itemModel as? JXSegmentedDotItemModel else {
            return
        }

        itemModel.dotOffset = dotOffset
        itemModel.dotState = dotStates[index]
        itemModel.dotColor = dotColor
        itemModel.dotSize = dotSize
        if dotCornerRadius == JXSegmentedViewAutomaticDimension {
            itemModel.dotCornerRadius = dotSize.height/2
        }else {
            itemModel.dotCornerRadius = dotCornerRadius
        }
    }
    
    
    
    
    
    
    
    
    
}
