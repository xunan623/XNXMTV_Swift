//
//  XNGameController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/17.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

private let kGameItemMargin : CGFloat = 4
private let kItemW = (kScreenW - kGameItemMargin * 4) / 3
private let kItemH = kScreenW / 2
private let kGameCellID = "XNCollectionGameCell"

class XNGameController: XNBaseController {
    
    fileprivate lazy var gameArray = [XNGameModel]()
    fileprivate lazy var gameVM: XNGameVM = XNGameVM()
    // 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = kGameItemMargin
        layout.minimumInteritemSpacing = kGameItemMargin
        layout.sectionInset = UIEdgeInsetsMake(kGameItemMargin, kGameItemMargin, kGameItemMargin, kGameItemMargin)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = BGCOLOR
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "XNCollectionGameCell", bundle: nil),
                                forCellWithReuseIdentifier: kGameCellID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        requestData()
    }
}

extension XNGameController {
    internal override func setupUI() {
        view.addSubview(collectionView)
    }
    fileprivate func requestData() {
        gameVM.loadgGameData {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - 遵守协议
extension XNGameController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.gameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! XNCollectionGameCell
        cell.backgroundColor = UIColor.white
        cell.gameModel = gameVM.gameArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let moreVC = XNMoreLivingController()
        let model = gameVM.gameArray[indexPath.item]
        moreVC.cateName = model.ename
        moreVC.title = model.cname
        self.navigationController?.pushViewController(moreVC, animated: true)
    }
}


















