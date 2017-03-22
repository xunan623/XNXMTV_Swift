//
//  XNNavigationController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), for: UIBarMetrics.default)
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - 拦截push控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count < 1 {
            viewController.navigationItem.rightBarButtonItem = setRightButton()
        } else {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // MARK: - 设置返回按钮
    func setBackBarButtonItem() -> UIBarButtonItem {
        
        let backButton = UIButton.init(type: .custom)
        backButton.setImage(UIImage(named: "setting_back"), for: .normal)
        backButton.sizeToFit()
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backButton.addTarget(self, action: #selector(self.backClick), for: .touchUpInside)
        return UIBarButtonItem.init(customView: backButton)
    }
    
    // MARK: - 设置右边按钮
    func setRightButton() -> UIBarButtonItem {
        let searchItem = UIButton.init(type: .custom)
        searchItem.setImage(UIImage(named: "searchbutton_nor"), for: .normal)
        searchItem.sizeToFit()
        searchItem.frame.size = CGSize(width: 30, height: 30)
        searchItem.contentHorizontalAlignment = .right
        searchItem.addTarget(self, action: #selector(self.searchClick), for: .touchUpInside)
        return UIBarButtonItem.init(customView: searchItem)
    }
    
    
    /// 返回
    func backClick() {
        self.popViewController(animated: true)
    }
    
    
    /// 点击右边的搜索
    func searchClick() {
        
    }
    
}
