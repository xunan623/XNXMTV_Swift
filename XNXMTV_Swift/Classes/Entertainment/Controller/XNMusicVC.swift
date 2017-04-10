//
//  XNMusicVC.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNMusicVC: XNBaseEntertainmentVC {

    fileprivate lazy var musicVM: XNMusicVM = XNMusicVM()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadData() {
        baseVM = self.musicVM
        musicVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
