//
//  ViewController.swift
//  ZHXBaseSwift
//
//  Created by liyuan on 2018/1/24.
//  Copyright © 2018年 zhx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tv = UITextView().text(UIFont.systemFont(ofSize: 15), UIColor.blue,"会计师").backgroundColor(UIColor.gray).into(self.view)
        tv.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.left.right.equalTo(self.view).inset(UIEdgeInsetsMake(40, 10, 0, 10))
        }
        
        self.view.showStatus(.progress)
        self.view.showStatus(.fail, "失败失败", self, #selector(reloadData))
        self.view.showStatus(.empty, "空")
        self.view.showStatus(.success)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MyCell.self, indexPath)
        cell?.lb?.text = "collectionView"
        return cell!
    }
    
    @objc func reloadData() {
        print("加载")
    }
}

class MyCell: UICollectionViewCell {
    
    var lb : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        lb = UILabel().text("文本", UIFont.systemFont(ofSize: 14), UIColor.orange).into(self.contentView)
        lb?.snp.makeConstraints({ make in
            make.center.equalTo(self.contentView)
        })
    }
}

