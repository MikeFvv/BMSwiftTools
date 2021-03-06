//
//  HomeViewController.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit
import MJRefresh


class HomeViewController: UIViewController {

    lazy var items = [ExampleModelName]()
    static let ItemCellId = "item"
    var page = 0
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        
        tableView.tableFooterView = UIView()
        
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 44;
//        tableView.register(NewsRecommendTableViewCell.self, forCellReuseIdentifier: NewsRecommendTableViewCell.reuseId)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        
        createUI()
        
        
        //刷新头部
        let header = MJRefreshNormalHeader(refreshingBlock: self.loadNewData)
        header.beginRefreshing()
        tableView.mj_header = header
        
        //刷新尾部
        let footer = MJRefreshAutoNormalFooter(refreshingBlock: self.loadMoreData)
        tableView.mj_footer = footer
    }
    
    func createUI() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    
    func loadNewData(){
        //请求数据
        AF.request(API.imgrank,parameters: ["page": 1]).responseJSON { response in
            do {
//                guard let dict:Any = try response.result.get() else { return }
//                let json = JSON(dict)["items"].arrayObject
//                guard let models = json?.kj.modelArray(ExampleModelName.self) else { return }
//
//
//                self.items.removeAll()
//                self.items.append(contentsOf: models)
//                //重新加载数据
//                self.tableView.reloadData()
//                //接收加载
//                self.tableView.mj_header?.endRefreshing()
//
//                //下拉刷新完成后，将配置置为 1
//                self.page = 1
            } catch {
               print(error)
            }
        }
    }
    
    func loadMoreData(){
        //请求数据
        AF.request(API.imgrank,parameters: ["page": page + 1]).responseJSON { response in
            do {
//                guard let dict:Any = try response.result.get() else { return }
//                let json = JSON(dict)["items"].arrayObject
//                guard let models = json?.kj.modelArray(ExampleModelName.self) else { return }
//
//                self.items.append(contentsOf: models)
//                //重新加载数据
//                self.tableView.reloadData()
//                //接收加载
//                self.tableView.mj_footer?.endRefreshing()
//
//                //下拉刷新完成后，将配置置为 1
//                self.page += 1
            } catch {
               print(error)
            }
        }
    }

}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.mj_footer?.isHidden = items.count == 0
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Self.ItemCellId,for: indexPath)
        //页面复用
        var tmp = tableView.dequeueReusableCell(withIdentifier: Self.ItemCellId)
        if tmp == nil {
            tmp = UITableViewCell(style: .subtitle, reuseIdentifier: Self.ItemCellId)
        }
        
        let cell = tmp!
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.content
        //图片下载
//        let url = (item.user?.thumb ?? "").replacingOccurrences(of: ".webp", with: ".png")
        let url = item.user?.thumb ?? ""
//        cell.imageView?.kf.setImage(with: URL(string: url),options: [.processor(WebPProcessor.default),.cacheSerializer(WebPSerializer.default)])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    //每个item的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
