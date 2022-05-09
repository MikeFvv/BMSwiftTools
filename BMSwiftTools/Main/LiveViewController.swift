//
//  LiveViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createUI()
    }
    
    func createUI() {
        
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(200)
            make.left.equalTo(view).offset(50)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        greenView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(250)
            make.left.equalTo(view).offset(100)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        blueView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(300)
            make.left.equalTo(view).offset(150)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        //Swift UIView 层次调整
        // 将红色挪到最上边
        view.bringSubviewToFront(redView)
        // 将蓝色挪到最下边
        view.sendSubviewToBack(blueView)
        // 互换
        view.exchangeSubview(at: 1, withSubviewAt: 2)
    }
       

}
