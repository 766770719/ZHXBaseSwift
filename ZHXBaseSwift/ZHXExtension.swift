//
//  ZHXExtension.swift
//  ZHXBaseSwift
//
//  Created by liyuan on 2018/1/24.
//  Copyright © 2018年 zhx. All rights reserved.
//

import UIKit
import SnapKit
import SwiftOnoneSupport

extension UIWindow {

    convenience init(_ vc : UIViewController, _ backgroundColor : UIColor) {
        self.init(frame: UIScreen.main.bounds)
        self.backgroundColor = backgroundColor
        self.rootViewController = vc
        self.makeKeyAndVisible()
    }
}

extension UIColor {
    
    /// 颜色转为图片
    func image() -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}

extension UIView {
    
    //布局部分
    
    func requireContentCompressionResistanceVertical() {
        self.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func requireContentCompressionResistanceHorizontal() {
        self.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func requireContentHuggingVertical() {
        self.setContentHuggingPriority(.required, for: .vertical)
    }
    
    func requireContentHuggingHorizontal() {
        self.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    func requireContentWrapVertial() {
        requireContentCompressionResistanceVertical()
        requireContentHuggingVertical()
    }
    
    func requireContentWrapHorizontal() {
        requireContentCompressionResistanceHorizontal()
        requireContentHuggingHorizontal()
    }
    
    //其他
    
    @discardableResult
    func into(_ parent : UIView) -> Self {
        parent.addSubview(self)
        return self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor : UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func dashedLine(_ strokeColor : UIColor,_ fillColor : UIColor,_ viewSize : CGSize,_ lineWidth : CGFloat,_ strokeWidth : Float,_ fillWidth : Float) -> Self {
        let rect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        
        let layer = CAShapeLayer()
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.path = UIBezierPath(rect: rect).cgPath
        layer.frame = rect
        layer.lineWidth = lineWidth
        layer.lineDashPattern = [NSNumber(value: strokeWidth),NSNumber(value: fillWidth)]
        self.layer.addSublayer(layer)
        
        return self
    }
    
    @discardableResult
    func corner(_ radius : CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
}

extension UILabel {
    
    @discardableResult
    func text(_ text : String?, _ font : UIFont, _ textColor : UIColor) -> Self {
        self.text = text
        self.font = font
        self.textColor = textColor
        return self
    }
}

extension UIImageView {
    
    @discardableResult
    func image(_ image : UIImage?) -> Self {
        self.image = image
        return self
    }
}

extension UIButton {
    
    @discardableResult
    func title(_ title : String?, _ titleColor : UIColor?, _ state : UIControlState = .normal) -> Self {
        self.setTitle(title, for: state)
        self.setTitleColor(titleColor, for: state)
        return self
    }
    
    @discardableResult
    func font(_ font : UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func backgroundImage(_ backgroundImage : UIImage?, _ state : UIControlState = .normal) -> Self {
        self.setBackgroundImage(backgroundImage, for: state)
        return self
    }
    
    @discardableResult
    func image(_ image : UIImage?, _ state : UIControlState = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
}

// MARK: - UITableView

extension UITableView {
    
    convenience init(_ delegate : UITableViewDelegate?,_ dataSource : UITableViewDataSource?,_ style : UITableViewStyle = .grouped) {
        self.init(frame: CGRect.null, style: style)
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    @discardableResult
    func register(_ cellClass : AnyClass) -> Self {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
        return self
    }
    
    func dequeueReusableCell<T : UITableViewCell>(_ cellClass : T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass)) as? T
    }
}

extension NSObject {
    
    @objc func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    @objc func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

