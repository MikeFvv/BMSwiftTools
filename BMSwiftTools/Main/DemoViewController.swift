//
//  DemoViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .yellow
        
        let bgBox = UIView()
        bgBox.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        bgBox.layer.borderWidth = 1
        bgBox.layer.borderColor = UIColor.red.cgColor
        view.addSubview(bgBox)
        
        bgBox.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(200)
            make.left.equalTo(view).offset(70)
            make.size.equalTo(300)
        }
    }
    
    
    
    

}
