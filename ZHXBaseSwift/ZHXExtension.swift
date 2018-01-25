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

    public convenience init(_ vc : UIViewController, _ backgroundColor : UIColor) {
        self.init(frame: UIScreen.main.bounds)
        self.backgroundColor = backgroundColor
        self.rootViewController = vc
        self.makeKeyAndVisible()
    }
}

extension UIColor {
    
    /// 颜色转为图片
    public func image() -> UIImage? {
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
    
    public func requireContentCompressionResistanceVertical() {
        self.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    public func requireContentCompressionResistanceHorizontal() {
        self.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    public func requireContentHuggingVertical() {
        self.setContentHuggingPriority(.required, for: .vertical)
    }
    
    public func requireContentHuggingHorizontal() {
        self.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    public func requireContentWrapVertial() {
        requireContentCompressionResistanceVertical()
        requireContentHuggingVertical()
    }
    
    public func requireContentWrapHorizontal() {
        requireContentCompressionResistanceHorizontal()
        requireContentHuggingHorizontal()
    }
    
    //其他
    
    @discardableResult
    public func into(_ parent : UIView) -> Self {
        parent.addSubview(self)
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ backgroundColor : UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    public func dashedLine(_ strokeColor : UIColor,_ fillColor : UIColor,_ viewSize : CGSize,_ lineWidth : CGFloat,_ strokeWidth : Float,_ fillWidth : Float) -> Self {
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
    public func corner(_ radius : CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }
}

extension UILabel {
    
    @discardableResult
    public func text(_ text : String?, _ font : UIFont, _ textColor : UIColor) -> Self {
        self.text = text
        self.font = font
        self.textColor = textColor
        return self
    }
}

extension UIImageView {
    
    @discardableResult
    public func image(_ image : UIImage?) -> Self {
        self.image = image
        return self
    }
}

extension UIButton {
    
    @discardableResult
    public func title(_ title : String?, _ titleColor : UIColor?, _ state : UIControlState = .normal) -> Self {
        self.setTitle(title, for: state)
        self.setTitleColor(titleColor, for: state)
        return self
    }
    
    @discardableResult
    public func font(_ font : UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    public func backgroundImage(_ backgroundImage : UIImage?, _ state : UIControlState = .normal) -> Self {
        self.setBackgroundImage(backgroundImage, for: state)
        return self
    }
    
    @discardableResult
    public func image(_ image : UIImage?, _ state : UIControlState = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
}

extension UITextField {
    
    @discardableResult
    public func text(_ font : UIFont?,_ textColor : UIColor?,_ text : String? = nil) -> Self {
        self.font = font
        self.textColor = textColor
        self.text = text
        self.clipsToBounds = true
        return self
    }
    
    @discardableResult
    public func placeHolder(_ placeHolder : String,_ placeHolderColor : UIColor) -> Self {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor : placeHolderColor])
        return self
    }
}

extension UITextView {
    
    @discardableResult
    public func text(_ font : UIFont?,_ textColor : UIColor?,_ text : String? = nil) -> Self {
        self.font = font
        self.textColor = textColor
        self.text = text
        self.textContainerInset = UIEdgeInsets.zero
        return self
    }
}

// MARK: - UITableView

extension UITableView {
    
    public convenience init(_ delegate : UITableViewDelegate?,_ dataSource : UITableViewDataSource?,_ style : UITableViewStyle = .grouped) {
        self.init(frame: CGRect.null, style: style)
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    @discardableResult
    public func register(_ cellClass : AnyClass) -> Self {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
        return self
    }
    
    public func dequeueReusableCell<T : UITableViewCell>(_ cellClass : T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass)) as? T
    }
}

extension NSObject {
    
    @objc public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    @objc public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

// MARK: - UICollectionView

extension UICollectionView {
    
    public var flowLayout : UICollectionViewFlowLayout? { return self.collectionViewLayout as? UICollectionViewFlowLayout }
    
    public convenience init(_ delegate : UICollectionViewDelegate?,_ dataSource : UICollectionViewDataSource?) {
        self.init(frame: CGRect.null, collectionViewLayout: UICollectionViewFlowLayout())
        self.backgroundColor = UIColor.clear
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    @discardableResult
    public func itemSize(_ itemSize : CGSize,_ itemSpacing : CGFloat = 0,_ lineSpacing : CGFloat = 0) -> Self {
        flowLayout?.itemSize = itemSize
        flowLayout?.minimumInteritemSpacing = itemSpacing
        flowLayout?.minimumLineSpacing = lineSpacing
        return self
    }
    
    @discardableResult
    public func sectionInset(_ sectionInset : UIEdgeInsets) -> Self {
        flowLayout?.sectionInset = sectionInset
        return self
    }
    
    @discardableResult
    public func register(_ cellClass : AnyClass) -> Self {
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
        return self
    }
    
    public func dequeueReusableCell<T : UICollectionViewCell>(_ cellClass : T.Type,_ indexPath : IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as? T
    }
}

