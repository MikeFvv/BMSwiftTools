//
//  DemoViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/10/22.1
//

import UIKit

class DemoViewController: UIViewController {
    
    private var dataArray = [TaskModel]()
    
    private lazy var tableView: UITableView = {
        let instance = UITableView(frame: .zero, style: .plain)
        instance.showsVerticalScrollIndicator = false
        instance.showsHorizontalScrollIndicator = false
        instance.delegate = self
        instance.dataSource = self
        instance.contentInsetAdjustmentBehavior = .never
        instance.estimatedSectionHeaderHeight = 0
        instance.estimatedSectionFooterHeight = 0
        
//        instance.tableFooterView = UIView()
        
        instance.rowHeight = UITableView.automaticDimension;
        instance.estimatedRowHeight = 81;
        instance.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseId)
        
        return instance
    }()
    
    private lazy var headerView: TaskHeaderView = {
        let instance = TaskHeaderView()
        instance.backgroundColor = .white
        return instance
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    
    func createUI() {
        view.backgroundColor = .yellow
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = UIColor(hex: "#E2E2E2")
        
        headerView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 130 + 10*3 + 260)
        tableView.tableHeaderView = headerView
        
    }
}


extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.dataArray.count
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if self.dataArray.count > 0 {
//            return 73
//        }
        return 81
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseId, for: indexPath) as! TaskTableViewCell
            
//            cell.updateData(dataArray[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
//        let vc = NewsDetailsController()
//        let model = self.dataArray[indexPath.row]
//        vc.newsId = model.id;
//        currNavigationController().pushViewController(vc, animated: true)
        
    }
    
    
    // MARK: -- 限制一下，防止拉出下面的白色底背景了
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -60 {
            scrollView.contentOffset = CGPoint(x: 0, y: -60)
        }
    }
    
    
    private func endRefresh() {
        self.tableView.mj_header?.endRefreshing()
//        delayWithSeconds(0.3) {
//            self.tableView.insertSubview(self.headerView, at: 0)
//        }
    }
    
}
