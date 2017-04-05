//
//  XNBaseEntertainmentVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNBaseEntertainmentVC: XNBaseController {
    
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
        collectionView.register(UINib(nibName: "XNCollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: NormalCellID)
        return collectionView

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
}

extension XNBaseEntertainmentVC {
    override func setupUI() {
        contentView = collectionView
        view.addSubview(collectionView)
        super.setupUI()
    }
}

extension XNBaseEntertainmentVC {
    func loadData() {}
}

extension XNBaseEntertainmentVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if baseVM.anchorGroups.count > 0 {
            return baseVM.anchorGroups[section].anchors.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellID, for: indexPath) as! XNCollectionNormalCell
        return cell
    }
}

extension XNBaseEntertainmentVC : UICollectionViewDelegate {
    
}

























































