//
//  XNAllLivingVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNAllLivingVC: XNBaseSearchVC {

    fileprivate lazy var allLinvingVM : XNAllLivingVM = XNAllLivingVM()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension XNAllLivingVC {
    override func loadData() {
        baseVM = self.allLinvingVM
        allLinvingVM.requestData { 
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
