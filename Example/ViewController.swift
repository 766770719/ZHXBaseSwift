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

        
        
        let cv = UICollectionView(self, self).itemSize(CGSize(width: WidthScreen/2-10-10, height: 90),20,20).sectionInset(UIEdgeInsetsMake(20, 10, 20, 10)).into(self.view)
        cv.flowLayout?.scrollDirection = .horizontal
        cv.register(MyCell.self)
        cv.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MyCell.self, indexPath)
        cell?.lb?.text = "collectionView"
        return cell!
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

