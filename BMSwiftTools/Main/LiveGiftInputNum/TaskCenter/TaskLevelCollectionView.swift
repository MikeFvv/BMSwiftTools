//
//  TaskLevelCollectionView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/24/22.
//

import UIKit

fileprivate let kGiftNumberPerPage = 8

protocol TaskLevelCollectionViewDelegate: AnyObject {
    func giftListView(_ view: TaskLevelCollectionView, didSelected gift: TaskModel)
}

final public class TaskLevelCollectionView: UIView {
    weak var delegate: TaskLevelCollectionViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let instance = UICollectionView(frame: .zero, collectionViewLayout: layout)
        instance.backgroundColor = .white
        //        instance.contentSize = CGSize(width: rect.width * 10.0, height: rect.height)
        //每个分区的四边间距UIEdgeInsets
        instance.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        instance.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: TaskCollectionViewCell.reuseId)
        //        instance.register(HotLiveingHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HotLiveingHeader.reuseId)
        instance.delegate = self
        instance.dataSource = self
        instance.showsHorizontalScrollIndicator = false
        return instance
    }()
    
    private var taskDataArray = [TaskModel?]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(230)
        }
        
        setupData()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
//            guard let delegate = self.delegate, let gift = self.taskDataArray[0] else { return }
//            delegate.giftListView(self, didSelected: gift)
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension TaskLevelCollectionView {
    
    private func setupData() {
//        /// 初始化礼物
//        taskDataArray.append(TaskModel(id: "1", name: "小心心", icon: "gift_icon_1", price: 1))
//        taskDataArray.append(TaskModel(id: "2", name: "话筒", icon: "gift_icon_2", price: 2))
//        taskDataArray.append(TaskModel(id: "3", name: "麦克风", icon: "gift_icon_3", price: 5))
//        taskDataArray.append(TaskModel(id: "4", name: "萌小鸡", icon: "gift_icon_4", price: 10))
//        taskDataArray.append(TaskModel(id: "5", name: "手柄", icon: "gift_icon_5", price: 20))
//        taskDataArray.append(TaskModel(id: "6", name: "奖杯", icon: "gift_icon_6", price: 50))
//        taskDataArray.append(TaskModel(id: "7", name: "火箭", icon: "gift_icon_7", price: 100))
//        taskDataArray.append(TaskModel(id: "8", name: "礼花", icon: "gift_icon_8", price: 200))
//        taskDataArray.append(TaskModel(id: "9", name: "玫瑰花", icon: "gift_icon_9", price: 10))
//        taskDataArray.append(TaskModel(id: "10", name: "吉他", icon: "gift_icon_10", price: 20))
//
//        /// 补全礼物，确保整页有数据
//        let left = kGiftNumberPerPage - taskDataArray.count % kGiftNumberPerPage
//        (1...left).forEach { _ in
//            taskDataArray.append(nil)
//        }
//
//        /// UICollectionView Cell位置为上下->左右，需要调整展示位置
//        /// 展示位置对应数组位置1-1,2-5,3-2,4-6,5-3,6-7,7-4,8-8
//        let page = taskDataArray.count / kGiftNumberPerPage
//        (0..<page).forEach { pageIndex in
//            let fi = pageIndex * kGiftNumberPerPage - 1
//            taskDataArray[(fi+1)...(fi+8)] = [
//                taskDataArray[fi + 1],
//                taskDataArray[fi + 5],
//                taskDataArray[fi + 2],
//                taskDataArray[fi + 6],
//                taskDataArray[fi + 3],
//                taskDataArray[fi + 7],
//                taskDataArray[fi + 4],
//                taskDataArray[fi + 8]
//            ]
//        }
    }
    
}

extension TaskLevelCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return taskDataArray.count
        
        return 6
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.reuseId, for: indexPath) as! TaskCollectionViewCell
//        cell.updateData(taskDataArray[indexPath.item])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return taskDataArray[indexPath.item] != nil
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let gift = taskDataArray[indexPath.item], let delegate = delegate else {
            return
        }
        delegate.giftListView(self, didSelected: gift)
    }
}

extension TaskLevelCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10.0*3) / 4
        let height = (collectionView.bounds.height - 10.0) / 2
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

