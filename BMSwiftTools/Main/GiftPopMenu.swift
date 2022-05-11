//
//  GiftPopMenu.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import UIKit

protocol GiftPopMenuDelegate :NSObjectProtocol{
    func swiftPopMenuDidSelectIndex(index:Int)
}


public enum GiftPopMenuConfigure {
    case PopMenuTextFont(UIFont)            //菜单文字字体
    case PopMenuTextColor(UIColor)          //菜单文字颜色
    case PopMenuBackgroudColor(UIColor)     //菜单背景色
    case popMenuCornorRadius(CGFloat)            //菜单圆角
    case popMenuItemHeight(CGFloat)          //菜单行高度
    case popMenuSplitLineColor(UIColor)     //菜单分割线颜色
    case popMenuIconLeftMargin(CGFloat)          //icon左间距
    case popMenuMargin(CGFloat)              //菜单与屏幕边距
    case popMenuAlpha(CGFloat)              //菜单背景透明度
}

public class GiftPopMenu: UIView {
    
    //delegate
    weak var delegate : GiftPopMenuDelegate?
    //block
    public var didSelectMenuBlock:((_ index:Int)->Void)?
    
    let KScrW:CGFloat = UIScreen.main.bounds.size.width
    let KScrH:CGFloat = UIScreen.main.bounds.size.height
    

    
    //／*  -----------------------  外部参数 通过configure设置 ---------------------------- *／
    //区域外背景透明度
    private var popMenuOutAlpha:CGFloat = 0.3
    //背景色
    private var popMenuBgColor:UIColor = UIColor.white
    //圆角弧度
    private var popMenuCornorRadius:CGFloat = 6
    //文字颜色
    private var popMenuTextColor:UIColor = UIColor.black
    //字体大小等
    private var popMenuTextFont:UIFont = UIFont.systemFont(ofSize: 17)
    //菜单高度
    private var popMenuItemHeight:CGFloat = 44.0
    //菜单分割线颜色
    private var popMenuSplitLineColor:UIColor = UIColor(red: 222/255.0, green: 222/255.0, blue: 222/255.0, alpha: 0.5)
    //icon左间距
    private var popMenuIconLeftMargin:CGFloat = 6
    //菜单与屏幕边距
    private var popMenuMargin:CGFloat = 10
    
    //／*  -----------------------  外部参数 over------------------------------------------ *／
    
    private var popData:[(num:String,icon:String,title:String)]!       //数据源
    
    static let cellID:String = "GiftPopMenuCellID"
    private var myFrame:CGRect!     //tableview  frame
    
    var tableView:UITableView! = nil
    

    
 ///   初始化菜单
 ///
 /// - Parameters:
 ///   - menuWidth: 菜单宽度
 ///   - arrow: 箭头位置是popmenu相对整个屏幕的位置
 ///   - datas: 数据源，icon允许传空，数据源没数据，不会显示菜单
 ///   - configure: 配置信息，可不传
    init(menuWidth:CGFloat,arrow:CGPoint,datas:[(num:String,icon:String,title:String)],configures:[GiftPopMenuConfigure] = []) {
        super.init(frame: UIScreen.main.bounds)
        self.frame = UIScreen.main.bounds
        //读取配置
        configures.forEach { (config) in
            switch (config){
                case let .PopMenuTextFont(value):
                    popMenuTextFont = value
                case let .PopMenuTextColor(value):
                    popMenuTextColor = value
                case let .PopMenuBackgroudColor(value):
                    popMenuBgColor = value
                case let .popMenuCornorRadius(value):
                    popMenuCornorRadius = value
                case let .popMenuItemHeight(value):
                    popMenuItemHeight = value
                case let .popMenuSplitLineColor(value):
                    popMenuSplitLineColor = value
                case let .popMenuIconLeftMargin(value):
                    popMenuIconLeftMargin = value
                case let .popMenuMargin(value):
                    popMenuMargin = value
                case let .popMenuAlpha(value):
                    popMenuOutAlpha = value
            }
        }
        
        popData = datas
        //设置myFrame size  ,original会在后面计算
        myFrame = CGRect(x: arrow.x, y: arrow.y, width: menuWidth, height: popMenuItemHeight*CGFloat(popData.count))
        myFrame.size.height = min(KScrH/2, myFrame.height)
        myFrame.size.width = min(KScrW-popMenuMargin*2, myFrame.width)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func initViews() {
        self.backgroundColor = UIColor.black.withAlphaComponent(popMenuOutAlpha)
        
        tableView=UITableView(frame: CGRect(x: myFrame.origin.x,y: myFrame.origin.y,width: myFrame.width,height: myFrame.height), style: .plain)
        tableView.register(GiftPopMenuCell.classForCoder(), forCellReuseIdentifier: GiftPopMenu.cellID)
        tableView.backgroundColor = popMenuBgColor
        tableView.layer.cornerRadius = popMenuCornorRadius
        tableView.separatorStyle = .none
        tableView.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        UIView.animate(withDuration: 0.3) { 
            self.addSubview(self.tableView)
        }
    }
   
    
}



// MARK: - 页面显示、隐藏
extension GiftPopMenu{
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view != tableView{
            dismiss()
        }
    }
    
    public func show() {
        if popData.isEmpty{
            return
        }
        initViews()
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    public func dismiss() {
        self.removeFromSuperview()
    }

}

// MARK: - UITableViewDataSource,UITableViewDelegate
extension GiftPopMenu : UITableViewDataSource,UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if popData.count>indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: GiftPopMenu.cellID) as! GiftPopMenuCell
            
            let model = popData[indexPath.row]
            cell.setConfig(_txtColor: popMenuTextColor, _lineColor: popMenuSplitLineColor, _txtFont: popMenuTextFont, _iconLeft: popMenuIconLeftMargin)
            if indexPath.row == popData.count - 1 {
                cell.fill(num: model.num, iconName: model.icon, title: model.title, islast: true)
            }else{
                cell.fill(num: model.num, iconName: model.icon, title: model.title)
            }
            
            //灰色
            cell.selectionStyle = .gray
            return cell
        }
        
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return popMenuItemHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.delegate != nil{
            self.delegate?.swiftPopMenuDidSelectIndex(index: indexPath.row)
        }
        if didSelectMenuBlock != nil {
            didSelectMenuBlock!(indexPath.row)
        }
        
        dismiss()
    }
    
}



/// UITableViewCell
class GiftPopMenuCell: UITableViewCell {
    var numLabel:UILabel!
    var iconImage:UIImageView!
    var lblTitle:UILabel!
    var line:UIView!
    
    //自定义属性
    var lineColor:UIColor = UIColor(red: 222/255.0, green: 222/255.0, blue: 222/255.0, alpha: 0.5)
    var txtColor:UIColor = UIColor.black
    var txtFont:UIFont = UIFont.systemFont(ofSize: 17)
    var iconLeft:CGFloat = 5
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        numLabel = UILabel()
        numLabel.textColor = RGB(r: 2, g: 168, b: 162)
        numLabel.font = .systemFont(ofSize: 11, weight: .medium)
        numLabel.textAlignment = .center
//        numLabel.adjustsFontSizeToFitWidth = true
        self.contentView.addSubview(numLabel)
        
        iconImage = UIImageView()
        self.contentView.addSubview(iconImage)
        self.selectionStyle = .none
        
        lblTitle = UILabel()
        lblTitle.textAlignment = .left
        self.contentView.addSubview(lblTitle)
        
        line = UIView()
        self.contentView.addSubview(line)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func fill(num:String,iconName:String,title:String,islast:Bool = false) {
        numLabel.text = num
        if iconName.count > 0 {
            iconImage.image = UIImage(named: iconName)
        }
        lblTitle.text = title
        line.isHidden = islast
    }
    
    func setConfig(_txtColor:UIColor,_lineColor:UIColor,_txtFont:UIFont,_iconLeft:CGFloat) {
        txtColor = _txtColor
        txtFont = _txtFont
        lineColor = _lineColor
        iconLeft = _iconLeft
        
        line.backgroundColor = lineColor
        lblTitle.textColor = txtColor
        lblTitle.font = txtFont
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        self.numLabel.frame = CGRect(x: 5, y: 0, width: 40, height: height)
        self.iconImage.frame = CGRect(x: 40+iconLeft, y: (height - 15)/2, width: 15, height: 15)
        self.lblTitle.frame = CGRect(x: 40+20+iconLeft*2, y: 0, width: width - 40 - 15 - iconLeft*2, height: height)
        self.line.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: width, height: 0.5)
        
    }
    
    
}
