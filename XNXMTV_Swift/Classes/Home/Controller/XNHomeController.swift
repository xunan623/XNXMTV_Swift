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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension XNHomeController {
    internal override func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "title_image"))
        view.addSubview(pageMenuView)
    }
}

// MARK: - PageTitleViewDelegate代理实现
extension XNHomeController : XNPageMenuViewDelegate{
    func pageMenuView(_ titleView: XNPageMenuView, seletedIndex index: Int) {
        
    }
}





















