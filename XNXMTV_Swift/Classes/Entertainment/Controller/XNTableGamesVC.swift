//
//  XNTableGamesVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNTableGamesVC: XNBaseEntertainmentVC {

    fileprivate lazy var tableGamesVM: XNTableGamesVM = XNTableGamesVM()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadData() {
        baseVM = self.tableGamesVM
        tableGamesVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
