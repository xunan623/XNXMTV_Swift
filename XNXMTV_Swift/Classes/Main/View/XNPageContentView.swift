//
//  XNPageContentView.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

protocol XNPageContentViewDelegate : class {
    func pageContentView(_ contentView : XNPageContentView, progress : CGFloat, sourceIndex: Int, targetIndex: Int)
}

private let ContentCellID = "ContentCellID"

class XNPageContentView: UIView {

    // 默认控制器
    let defaultVcsCount = UserDefaults.standard.object(forKey: DEFAULT_CHILDVCS) as? Int
    fileprivate var isForbidScrollDelegate: Bool = false
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var childVcs : [UIViewController]
    // 需要改成弱引用, 否则会循环引用
    fileprivate weak var parentVC : UIViewController?
    // MARK: - 定义代理
    weak var delegate: XNPageContentViewDelegate?
    
    // MARK: - 懒加载
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!  // 使用[weak self] in 后: self.bounds.size => (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    
    init(frame: CGRect, childVcs : [UIViewController], parentVC: UIViewController?) {
        self.childVcs = childVcs
        self.parentVC = parentVC
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XNPageContentView {
    fileprivate func setupUI() {
        for childVcs in childVcs {
            parentVC?.addChildViewController(childVcs)
        }
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK: - 遵守UICollectionViewDataSource数据源协议
extension XNPageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
}

// MARK: - 遵守UICollectionViewDelegate代理
extension XNPageContentView : UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScrollDelegate = false
        startOffsetX = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 是点击传导过来的, 则不处理
        if isForbidScrollDelegate { return }
        
        // 滚动处理
        var progress : CGFloat = 0
        var sourceIndex : Int = 0
        var targetIndex : Int = 0
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        if currentOffsetX > startOffsetX {
            progress = currentOffsetX/scrollViewW - floor(currentOffsetX/scrollViewW)
            sourceIndex = Int(currentOffsetX/scrollViewW)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            // 完全滑过去
            if currentOffsetX - startOffsetX == scrollViewW {
                progress = 1
                targetIndex = sourceIndex
            }
        } else {
            progress = 1 - (currentOffsetX/scrollViewW - floor(currentOffsetX/scrollViewW))
            targetIndex = Int(currentOffsetX/scrollViewW)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
            // 完全划过去
            if startOffsetX - currentOffsetX == scrollViewW {
                sourceIndex = targetIndex
            }
        }
        delegate?.pageContentView(self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

// MARK: - homeVC作为PageView的代理, 再由homeVC调用这
extension XNPageContentView {
    func setCurrentIndex(currentIndex: Int) {
        isForbidScrollDelegate = true
        let offsetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x:offsetX, y: 0), animated: false)
    }
}

// MARK: - 公共方法, 当添加或移除分类后, 需要同步刷新PageContentView
extension XNPageContentView {
    // MARK: - 刷新子控制器
    public func reloadChildVcs(newChildVcs: [UIViewController]) {
        print("newChildVcs-", newChildVcs)
        if self.childVcs.count < (defaultVcsCount! + newChildVcs.count) {
            for childVC in newChildVcs {
                self.childVcs.append(childVC)
                parentVC?.addChildViewController(childVC)
            }
        } else {
            let count = self.childVcs.count - (defaultVcsCount! + newChildVcs.count)
            updateChildVcs(count: count)
        }
        UserDefaults.standard.set(self.childVcs.count, forKey: HOME_CHILDVCS)
        collectionView.reloadData()
    }
    
    // MARK: - 没有添加频道或者移除了所有的频道,回到默认状态
    public func setDefaultChildVcs() {
        // 移除 "精彩推荐" 和 "全部直播" 两个频道之外的所有控制器
        let counts = self.childVcs.count - defaultVcsCount!
        updateChildVcs(count: counts)
        UserDefaults.standard.set(self.childVcs.count, forKey: HOME_CHILDVCS)
        collectionView.reloadData()
    }
    
    // MARK: - 更新控制器
    func updateChildVcs(count: Int) {
        var i = 0
        let lastChildVcsCount = UserDefaults.standard.object(forKey: HOME_CHILDVCS) as! Int
        
        print("removecount-", count)
        for _ in 0..<count {
            self.childVcs.removeLast()
        }
        for childvc in (self.parentVC?.childViewControllers)! {
            if i > (lastChildVcsCount - count - 1) {
                childvc.removeFromParentViewController()
            }
            i += 1
        }
        
        for childs in self.childVcs {
            parentVC?.addChildViewController(childs)
        }
    }
}























































