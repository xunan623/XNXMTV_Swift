//
//  XNSmallShowController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNSmallShowController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        let webView = UIWebView(frame: CGRect(x: 0, y: 20, width: kScreenW, height: kScreenH - kTabBarH))
        webView.delegate = self
        view.addSubview(webView)
        webView.scrollView.bounces = false
        let reqeust = URLRequest(url: URL(string: "http://cong.panda.tv")!)
        webView.loadRequest(reqeust)
    }

}

extension XNSmallShowController : UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.description.contains("https://m.panda.tv/room.html") {
            return false
        } else {
            return true
        }
    }
}
