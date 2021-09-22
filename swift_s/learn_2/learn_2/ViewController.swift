//
//  ViewController.swift
//  learn_2
//
//  Created by bytedance on 2021/9/17.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var lable: UILabel = UILabel();
    lazy var fontTableView: UITableView = UITableView(frame: CGRect.init(), style: .grouped);
    var changeFontButton: UIButton = UIButton();
    var fontName: Array = Array<String>();
    var fontRowIndex = 0;
    var data = ["吞云吐雾半只烟","燃烬红尘两指间","半世空劳身已朽","唯凭此物得洞天"];
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(fontTableView)
        view.addSubview(changeFontButton)
        fontTableView.snp.makeConstraints { (make) in
            make.width.height.top.bottom.equalTo(view)     // 位于当前视图的中心
        }
        fontTableView.delegate = self
        fontTableView.dataSource = self
        //遍历电脑的字体
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                fontName.append(font)
            }
        }
        //改变按钮样式
        changeFontButton.layer.cornerRadius = 5
        changeFontButton.backgroundColor = UIColor.gray
        changeFontButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp_bottom).offset(-200)
            make.width.equalTo(100)
            make.height.equalTo(45)
            make.centerX.equalTo(view)
        }
        changeFontButton.addTarget(self, action: #selector(changeFontIndex), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func changeFontIndex() {
        fontRowIndex = (fontRowIndex + 1) % 25;
        fontTableView.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = fontTableView.dequeueReusableCell(withIdentifier: "font_cell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier:"font_cell")
        let text  = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont(name: self.fontName[fontRowIndex], size: 16)
        cell.detailTextLabel?.text = self.fontName[fontRowIndex]
        cell.detailTextLabel?.textColor = UIColor.red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
}

extension ViewController{
   
}
