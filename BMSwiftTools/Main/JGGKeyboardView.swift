//
//  JGGKeyboardView.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/11/22.
//

import UIKit


protocol JGGKeyboardViewDelegate: AnyObject {
    func jggKeyboardViewDidSelect(string :String)
}

final public class JGGKeyboardView: UIView {
    weak var delegate: JGGKeyboardViewDelegate?
    public var contentFrame:CGRect!
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let instance = UICollectionView(frame: .zero, collectionViewLayout: layout)
        instance.backgroundColor = .white
        //        instance.contentSize = CGSize(width: rect.width * 10.0, height: rect.height)
        //每个分区的四边间距UIEdgeInsets
        instance.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        instance.register(KeyBoardCell.self, forCellWithReuseIdentifier: "KeyBoardCell")
        instance.backgroundColor = .clear
        instance.delegate = self
        instance.dataSource = self
        instance.showsHorizontalScrollIndicator = false
        instance.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return instance
    }()
    
    private var gifts = ["1","2","3","4","5","6","7","8","9","0","确定","⬅️"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.frame = UIScreen.main.bounds
        
        createUI()
    }
    
    func createUI() {
        
        addSubview(collectionView)
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = self.contentFrame
        
//        collectionView.snp.makeConstraints { make in
//            make.left.top.right.bottom.equalToSuperview()
////            make.height.equalTo(230)
//        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension JGGKeyboardView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifts.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyBoardCell", for: indexPath) as! KeyBoardCell
        cell.updateData(gifts[indexPath.item])
        return cell
    }
    
//    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return gifts[indexPath.item] != nil
//    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = delegate else {
            return
        }
        
       let string = gifts[indexPath.item]
        delegate.jggKeyboardViewDidSelect(string: string)
    }
}

extension JGGKeyboardView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3
        let height = collectionView.bounds.height / 4
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - 页面显示、隐藏
extension JGGKeyboardView {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view != collectionView {
            dismiss()
        }
    }
    
    public func show() {
//        createUI()
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(self)
    }
    
    public func dismiss() {
        self.removeFromSuperview()
    }

}
