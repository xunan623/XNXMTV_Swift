//
//  XNUnLivingVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/11.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNUnLivingVC: XNBaseSearchVC {

    fileprivate lazy var searchVM: XNIsLivingVM = XNIsLivingVM()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

// MARK:- 发送网络请求
extension XNUnLivingVC {
    override func loadData() {
        baseVM = self.searchVM
        searchVM.status = 3
        searchVM.keywords = UserDefaults.standard.object(forKey: "keywords") as! String
        searchVM.requestLivingData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
