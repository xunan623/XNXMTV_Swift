//
//  XNEntertainmentController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class XNEntertainmentController: UIViewController {
    
    let titles = ["熊猫星秀", "户外直播", "音乐", "萌宠乐园", "桌游"]
    
    fileprivate lazy var pageTitleView : XNPageTitleView = { [weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titleView = XNPageTitleView(frame: titleFrame, titles: (self?.titles)!)
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var pageContentView: XNPageContentView = { [weak self] in
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH + 0.5, width: kScreenW, height: kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabBarH)
        var childVcs = [UIViewController]()
        childVcs.append(XNPandaStarShowVC())
        childVcs.append(XNOutdoorLivingVC())
        childVcs.append(XNMusicVC())
        childVcs.append(XNLovelyPetsVC())
        childVcs.append(XNTableGamesVC())

        let contentView = XNPageContentView(frame: contentFrame, childVcs: childVcs, parentVC: self)
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
}

extension XNEntertainmentController {
    fileprivate func setupUI() {
        // 不需要调整scrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
}

// MARK: - PageTileViewDelegate 代理实现
extension XNEntertainmentController : XNPageTitleViewDelegate {
    func pageTitleView(_ titleView: XNPageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

// MARK: - EntertainmentContentViewDelegate代理实现
extension XNEntertainmentController : XNPageContentViewDelegate {
    func pageContentView(_ contentView: XNPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}




