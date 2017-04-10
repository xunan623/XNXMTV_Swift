//
//  XNRecommendVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

private let kCycleViewH : CGFloat = kScreenW * 2 / 5

class XNRecommendVC: XNBaseRecommendVC {

    fileprivate lazy var recommendVM : XNRecommendVM = XNRecommendVM()
    fileprivate lazy var cycleView: XNBannerCycleView = {
        let cycleView = XNBannerCycleView.bannerCycleView()
        cycleView.frame = CGRect(x: 0, y: -kCycleViewH, width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    
}

extension XNRecommendVC {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(cycleView)
        collectionView.contentInset = UIEdgeInsetsMake(kCycleViewH, 0, 0, 0)
    }
    
}

// MARK: - 网络请求
extension XNRecommendVC {
    override func loadData() {
        baseVM = recommendVM
        // 闭包对VC有强引用 VC对recommendVM有强引用 recommendVM没有对闭包有强引用 =>没有形成循环引用
        recommendVM.requestData {
            self.collectionView.reloadData()
        }
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        self.loadDataFinished()
    }
}

extension XNRecommendVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return super.collectionView(collectionView, cellForItemAt: indexPath)
    }
}






















