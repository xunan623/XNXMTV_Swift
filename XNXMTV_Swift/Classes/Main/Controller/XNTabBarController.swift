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
        
    }
    
    fileprivate func setupOneChildViewController(_ title: String,
                                                 image: String,
                                                 selectedImage: String,
                                                 controller: UIViewController) {
    
    }
}
