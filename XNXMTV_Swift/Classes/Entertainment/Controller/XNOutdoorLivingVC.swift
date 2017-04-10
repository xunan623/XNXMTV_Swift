//
//  XNOutdoorLivingVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNOutdoorLivingVC: XNBaseEntertainmentVC {

    fileprivate lazy var outdoorVM: XNOutdoorLivingVM = XNOutdoorLivingVM()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadData() {
        baseVM = self.outdoorVM
        outdoorVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }

}
