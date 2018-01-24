//
//  ViewController.swift
//  ZHXBaseSwift
//
//  Created by liyuan on 2018/1/24.
//  Copyright © 2018年 zhx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel().text("UILabel", UIFont.systemFont(ofSize: 14), UIColor.black).into(self.view)
        label.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view).inset(UIEdgeInsets(top: 40, left: 14, bottom: 0, right: 0))
        }
        
        let dashLineViewSize = CGSize(width: 100, height: 100)
        let dashLineView = UIView().into(self.view)
        dashLineView.dashedLine(UIColor.blue, UIColor.white, dashLineViewSize, 1, 5, 10)
        dashLineView.snp.makeConstraints { make in
            make.size.equalTo(dashLineViewSize)
            make.top.equalTo(label.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
        
        let btn = UIButton().title("UIButton", UIColor.black, .normal).font(UIFont.systemFont(ofSize: 14)).backgroundImage(UIColor.orange.image()).into(self.view)
        btn.snp.makeConstraints { make in
            make.top.equalTo(dashLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
    }
}

