//
//  ZHXExtension.swift
//  ZHXBaseSwift
//
//  Created by liyuan on 2018/1/24.
//  Copyright © 2018年 zhx. All rights reserved.
//

import UIKit
import SnapKit
import DynamicColor
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

// MARK: - UIView:Status

/// View的状态枚举
public enum ViewStatus {
    case progress
    case fail
    case empty
    case success
}

/// View的状态配置信息
public struct ViewStatusConfig {
    //Progress
    public static var progressStyle = UIActivityIndicatorViewStyle.whiteLarge
    public static var progressColor = UIColor.gray
    //Fail
    public static var failReasonFont = UIFont.systemFont(ofSize: 14)
    public static var failReasonTextColor = UIColor(hexString: "#999999")
    public static var failButtonText = "重新加载"
    public static var failButtonFont = UIFont.systemFont(ofSize: 15)
    public static var failButtonTextColor = UIColor.white
    public static var failButtonBackgroundImage = UIColor(hexString: "#05931e").image()
    public static var failButtonCorner : CGFloat = 5
    public static var failButtonSize = CGSize(width: 112, height: 32)
    //Empty
    public static var emptyFont = UIFont.systemFont(ofSize: 14)
    public static var emptyTextColor = UIColor(hexString: "#999999")
}

extension UIView {
    
    /// 配置简写
    private typealias Config = ViewStatusConfig
    
    //Keys
    
    private static var KeyVgStatusProgress : Void?
    private static var KeyVgStatusFail : Void?
    private static var KeyVgStatusEmpty : Void?
    
    //Properties
    
    private var vgStatusProgress: UIView? {
        set {
            objc_setAssociatedObject(self, &UIView.KeyVgStatusProgress, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &UIView.KeyVgStatusProgress) as? UIView
        }
    }
    
    private var vgStatusFail: UIView? {
        set {
            objc_setAssociatedObject(self, &UIView.KeyVgStatusFail, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &UIView.KeyVgStatusFail) as? UIView
        }
    }
    
    private var vgStatusEmpty: UIView? {
        set {
            objc_setAssociatedObject(self, &UIView.KeyVgStatusEmpty, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &UIView.KeyVgStatusEmpty) as? UIView
        }
    }
    
    /// 显示View的状态
    public func showStatus(_ status : ViewStatus,_ text : String? = nil,_ target : Any? = nil,_ action : Selector? = nil) {
        showStatusSuccess()
        if status == .progress {
            showStatusProgress()
        }else if status == .fail {
            showStatusFail(text, target!, action!)
        }else if status == .empty {
            showStatusEmpty(text)
        }
    }
    
    private func showStatusProgress() {
        vgStatusProgress = UIView().into(self)
        vgStatusProgress?.snp.makeConstraints({ make in
            make.center.equalTo(self)
        })
        
        let aiv = UIActivityIndicatorView(activityIndicatorStyle: Config.progressStyle).into(vgStatusProgress!)
        aiv.color = Config.progressColor
        aiv.startAnimating()
        aiv.snp.makeConstraints { make in
            make.edges.equalTo(vgStatusProgress!)
        }
    }
    
    private func showStatusFail(_ text : String?,_ target : Any,_ action : Selector) {
        vgStatusFail = UIView().into(self)
        vgStatusFail?.snp.makeConstraints({ make in
            make.left.right.equalTo(self).inset(UIEdgeInsetsMake(0, 36, 0, 36))
            make.center.equalTo(self)
        })
        
        let lb = UILabel().text(text, Config.failReasonFont, Config.failReasonTextColor).into(vgStatusFail!)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.snp.makeConstraints { make in
            make.top.left.right.equalTo(vgStatusFail!)
        }
        
        let btn = UIButton().title(Config.failButtonText, Config.failButtonTextColor).font(Config.failButtonFont)
            .backgroundImage(Config.failButtonBackgroundImage).corner(Config.failButtonCorner).into(vgStatusFail!)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.snp.makeConstraints { make in
            make.size.equalTo(Config.failButtonSize)
            make.top.equalTo(lb.snp.bottom).offset(6);
            make.bottom.centerX.equalTo(vgStatusFail!);
        }
    }
    
    private func showStatusEmpty(_ text : String?) {
        vgStatusEmpty = UIView().into(self)
        vgStatusEmpty?.snp.makeConstraints({ make in
            make.left.right.equalTo(self).inset(UIEdgeInsetsMake(0, 36, 0, 36))
            make.center.equalTo(self)
        })
        
        let lb = UILabel().text(text, Config.emptyFont, Config.emptyTextColor).into(vgStatusEmpty!)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.snp.makeConstraints { make in
            make.edges.equalTo(vgStatusEmpty!);
        }
    }
    
    private func showStatusSuccess() {
        vgStatusProgress?.removeFromSuperview()
        vgStatusFail?.removeFromSuperview()
        vgStatusEmpty?.removeFromSuperview()
    }
}

