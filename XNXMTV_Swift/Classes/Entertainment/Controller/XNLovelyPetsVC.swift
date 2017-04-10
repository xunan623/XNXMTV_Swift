//
//  XNLovelyPetsVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNLovelyPetsVC: XNBaseEntertainmentVC {

    fileprivate lazy var lovelyVM: XNLovelyPetsVM = XNLovelyPetsVM()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadData() {
        baseVM = self.lovelyVM
        lovelyVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
