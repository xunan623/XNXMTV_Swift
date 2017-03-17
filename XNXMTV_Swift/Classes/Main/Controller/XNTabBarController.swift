//
//  XNTabBarController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNTabBarController: UITabBarController {
    
    override class func initialize() {
        var attrs = [String: NSObject]()
        attrs[NSForegroundColorAttributeName] = UIColor(r: 87, g: 206, b: 138)
        UITabBarItem.appearance().setTitleTextAttributes(attrs, for: .selected)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 49))
        backView.backgroundColor = UIColor.white
        tabBar.insertSubview(backView, at: 0)
        tabBar.isOpaque = true
        
    }
    
    func addChildViewControllers() {
        setupOneChildViewController("首页", image: "menu_homepage_nor", selectedImage: "menu_homepage_sel", controller: XNHomeController.init())
        setupOneChildViewController("游戏", image: "menu_youxi_nor", selectedImage: "menu_youxi_sel", controller: XNGameController.init())
        setupOneChildViewController("娱乐", image: "menu_yule_nor", selectedImage: "menu_yule_sel", controller: XNEntertainmentController.init())
        setupOneChildViewController("小葱秀", image: "menu_goddess_nor", selectedImage: "menu_goddess_sel", controller: XNSmallShowController.init())
        setupOneChildViewController("我的", image: "menu_mine_nor", selectedImage: "menu_mine_sel", controller: UIStoryboard(name: "XNMe", bundle: nil).instantiateInitialViewController()!)
    }
    
    fileprivate func setupOneChildViewController(_ title: String,
                                                 image: String,
                                                 selectedImage: String,
                                                 controller: UIViewController) {
        
        controller.tabBarItem.title = title
        controller.title = title
        controller.view.backgroundColor = BGCOLOR
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let nav = XNNavigationController.init(rootViewController: controller)
        addChildViewController(nav)
    }
}
