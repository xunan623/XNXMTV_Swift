//
//  XNBaseSearchVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNBaseSearchVC: XNBaseController {

    var baseVM: XNBaseVM!
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.sectionInset = UIEdgeInsetsMake(kItemMargin, kItemMargin, 0, kItemMargin)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        collectionView.register(UINib(nibName: "XNCollectionSearchCell", bundle: nil), forCellWithReuseIdentifier: SearchCellID)

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

extension XNBaseSearchVC {
    override func setupUI() {
        contentView = collectionView
        view.addSubview(collectionView)
        super.setupUI()
    }
}

extension XNBaseSearchVC {
    func loadData() {}
}

extension XNBaseSearchVC : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if baseVM.searchGroup.count > 0 {
            return baseVM.searchGroup[section].anchors.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCellID, for: indexPath) as! XNCollectionSearchCell
        cell.anchor = baseVM.searchGroup[indexPath.section].anchors[indexPath.item]
        return cell
    }
}
















