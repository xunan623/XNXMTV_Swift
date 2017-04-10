//
//  XNPandaStarShowVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNPandaStarShowVC: XNBaseEntertainmentVC {
    
    fileprivate lazy var starShowVM: XNPandaStarShowVM = XNPandaStarShowVM()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - 网络请求
extension XNPandaStarShowVC {
    override func loadData() {
        baseVM = self.starShowVM
        starShowVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
