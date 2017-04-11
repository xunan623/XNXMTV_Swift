//
//  XNIsLivingVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/11.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNIsLivingVC: XNBaseSearchVC {

    fileprivate lazy var searchVM: XNIsLivingVM = XNIsLivingVM()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension XNIsLivingVC {
    override func loadData() {
        baseVM = self.searchVM
        searchVM.status = 2
        searchVM.keywords = UserDefaults.standard.object(forKey: "keywords") as! String
        searchVM.requestLivingData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
