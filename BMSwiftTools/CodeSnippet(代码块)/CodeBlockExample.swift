//
//  CodeBlockExample.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/12/22.
//

import UIKit
import Foundation


/// <#xxx属性 #">



// MARK: - 按钮监听方法




class CodeBlockExample {
    
    // MARK: - 属性创建及初始化
    // 创建数组
    var array1: [Int] = []  // []
    var arrya2: Array<Int> = [1, 2, 3] // [1, 2, 3]
    var arryaInt = [1, 2, 3]  // [1, 2, 3]
    var array3 = Array(arrayLiteral: 1, 2, 3) // [1, 2, 3]
    lazy var statusList = [NSString]()
    
    
    
    
    
    
    // MARK: - 创建视图
    private lazy var nextBtn : UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("下一篇", for: .normal)
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.backgroundColor = RGB(r: 219, g: 178, b: 114)
        nextBtn.titleLabel?.font = UIFont.pingFangRegular(14)
        //            nextBtn.setImage(UIImage(named: "1582"), for: .normal)
        nextBtn.adjustsImageWhenHighlighted = false
        
        //            let space = 3.0
        //        nextBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //            nextBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -space, bottom: 0, right: space)
        //            nextBtn.imageView?.contentMode = .scaleAspectFit
        nextBtn.addTarget(self,
                          action: #selector(nextBtnClick),
                          for: .touchUpInside)
        
        return nextBtn
    }()
    
    
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView()
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
    
    
    
    let lineView = UIView()
    lineView.backgroundColor = .red
    contentView.addSubview(lineView)
    lineView.snp.makeConstraints { make in
        make.left.equalTo(12)
        make.right.equalTo(-12)
        make.height.equalTo(1)
        make.bottom.equalTo(0)
    }
    
    
    
}
