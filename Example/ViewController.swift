//
//  ViewController.swift
//  ZHXBaseSwift
//
//  Created by liyuan on 2018/1/24.
//  Copyright © 2018年 zhx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tb = UITableView(self, self).into(self.view)
        tb.register(MyCell.self).rowHeight = MyCell.height
        tb.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MyCell.self)
        cell?.lb?.text = "什么东西"
        return cell!
    }
}

class MyCell: UITableViewCell {
    
    static var height: CGFloat { return 40 }
    
    var lb : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        lb = UILabel().text("文本", UIFont.systemFont(ofSize: 14), UIColor.orange).into(self.contentView)
        lb?.snp.makeConstraints({ make in
            make.left.equalTo(self.contentView).offset(14)
            make.centerY.equalTo(self.contentView)
        })
    }
}

