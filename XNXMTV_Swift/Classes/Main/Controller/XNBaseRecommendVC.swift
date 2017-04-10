//
//  XNBaseRecommendVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNBaseRecommendVC: XNBaseController {

    var baseVM: XNBaseVM!
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsetsMake(0, kItemMargin, 0, kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        collectionView.register(UINib(nibName: "XNCollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: NormalCellID)
        collectionView.register(UINib(nibName: "XNCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderViewID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

extension XNBaseRecommendVC {
    override func setupUI() {
        contentView = collectionView
        view.addSubview(collectionView)
        super.setupUI()
    }
    func loadData() {}
}

// MARK: - UICollectionView代理数据源方法
extension XNBaseRecommendVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellID, for: indexPath) as! XNCollectionNormalCell
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderViewID, for: indexPath) as! XNCollectionHeaderView
        headerView.delegate = self
        headerView.total = baseVM.anchorGroups[indexPath.section].total
        headerView.group = baseVM.anchorGroups[indexPath.section].type
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - XNCollectionViewHeaderViewDelegate
extension XNBaseRecommendVC: XNCollectionHeaderViewDelegate {
    func moreLivingList(cataName: String, titleName: String) {
        let moreVC = XNMoreLivingController()
        moreVC.cateName = cataName
        moreVC.title = titleName
        navigationController?.pushViewController(moreVC, animated: true)
    }
}





















