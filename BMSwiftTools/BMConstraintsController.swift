//
//  BMConstraintsController.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/12/22.
//

import UIKit

// MARK: - 名词解释

// 讲解约束的文章
// https://www.hanleylee.com/constraints-of-view-in-ios.html

/*
leading   -首部
trailing   -尾部
baseline-文本基线

leading 与 left 的区别 (同 trailing 与 right 的区别)
leading 的含义是头部, left 的含义是左.
对所有人来说, left 都是 left. 对中国人来说, 一行文字的 leading 是 left, 但是对一些其他文化的人 (比如穆斯林) 来说, 一行文字的 leading 则是right
 
 其中leading与left trailing与right 在正常情况下是等价的 但是当一些布局是从右至左时(比如阿拉伯文?没有类似的经验) 则会对调 换句话说就是基本可以不理不用 用left和right就好了


priority  -优先级
 优先级是可以附加约束链的结束位置：
 
 make.left.greaterThanOrEqualTo(label.mas_left).with.priorityLow();
 make.top.equalTo(label.mas_top).with.priority(600);
 
 
ignore    -忽略
 
 
 greaterThanOrEqualTo  -大于或等于
 lessThanOrEqualTo    -小于或等于
// 🔴大于或等于label.left:   //这两个约束完全相同
 make.left.greaterThanOrEqualTo(label);
 make.left.greaterThanOrEqualTo(label.mas_left);
 
 
 你想设置视图有一个最小和最大宽度
 // 🔴 width >= 200 && width <= 400
 make.width.greaterThanOrEqualTo(@200);
 make.width.lessThanOrEqualTo(@400)
 
 
// 使上、左、下、右相等 view2
 make.edges.equalTo(view2);

 
 // 使 top = superview.top + 5, left = superview.left + 10,
 // 使 top = superview.top + 5, left = superview.left + 10,
 // bottom = superview.bottom - 15, right = superview.right - 20
 make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20))
 
 
 
 // 使宽高大于等于titleLabel
 make.size.greaterThanOrEqualTo(titleLabel)

 // 🔴使宽度 = superview.width + 100, height = superview.height - 50
 make.size.equalTo(superview).sizeOffset(CGSizeMake(100, -50))
 
 
 
 // 使 centerX and centerY 等于 button1
 make.center.equalTo(button1)

 // 使 centerX 等于 superview.centerX - 5, centerY = superview.centerY + 10
 make.center.equalTo(superview).centerOffset(CGPointMake(-5, 10))
 
 
 // 除顶部外的所有边缘都应等于超级视图的边缘
 make.left.right.and.bottom.equalTo(superview);
 make.top.equalTo(otherView);
 
*/



/// 约束
class BMConstraintsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
