//
//  XNHomeController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class XNHomeController: XNBaseController {

    // MARK: - 懒加载属性
    fileprivate lazy var pageMenuView: XNPageMenuView = {
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let menuView = XNPageMenuView(frame: frame)
        menuView.delegate = self
        return menuView;
        
    }()
    
    fileprivate lazy var vc: UIViewController = {
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.randomColor()
        return vc
    }()

    
    fileprivate lazy var pageContentView: XNPageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0,
                                  y: kStatusBarH + kNavigationBarH + kTitleViewH,
                                  width: kScreenW,
                                  height: kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabBarH)
        var childVcs = [UIViewController]()
        
        let savedCount = UserDefaults.standard.object(forKey: HOME_CHILDVCS) as? Int
        
        if savedCount != nil {
            childVcs.append(XNRecommendVC())
            childVcs.append(XNAllLivingVC())
            if savedCount! > 1 {
                for _ in 0..<(savedCount! - 2) {
                    childVcs.append((self?.vc)!)
                }
            }
            UserDefaults.standard.set(childVcs.count, forKey: HOME_CHILDVCS)

        } else {
            childVcs.append(XNRecommendVC())
            childVcs.append(XNAllLivingVC())
            UserDefaults.standard.set(childVcs.count, forKey: DEFAULT_CHILDVCS)
            
        }
        let contentView = XNPageContentView(frame: contentFrame, childVcs: childVcs, parentVC: self)
        contentView.delegate = self as! XNPageContentViewDelegate?
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(updateChannel(notification:)), name: NotifyUpdateCategory, object: nil)

    }

}

extension XNHomeController {
    internal override func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "title_image"))
        view.addSubview(pageMenuView)
        view.addSubview(pageContentView)
    }
}

// MARK: - PageTitleViewDelegate代理实现
extension XNHomeController : XNPageMenuViewDelegate{
    func pageMenuView(_ titleView: XNPageMenuView, seletedIndex index: Int) {
        
    }
}

// MARK: - XNPageContentViewDelegate代理实现
extension XNHomeController : XNPageContentViewDelegate {
    func pageContentView(_ contentView: XNPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageMenuView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

// MARK: - updateChannel

extension XNHomeController {
    func updateChannel(notification: NSNotification) {
        let dict = notification.userInfo
        var childvcs = [UIViewController]()
        if dict != nil {
            guard let channels = dict![KSelectedChannel] else { return }
            
            if (channels as! [XNGameModel]).count > 0 {
                for _ in 0..<((channels as! [XNGameModel]).count) {
                    childvcs.append(self.vc)
                }
                pageContentView.reloadChildVcs(newChildVcs: childvcs)
            } else {
                pageContentView.setDefaultChildVcs()
            }
        }
    }
}



















































