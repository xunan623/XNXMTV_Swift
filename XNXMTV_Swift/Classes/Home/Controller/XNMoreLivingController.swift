//
//  XNMoreLivingController.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/5.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNMoreLivingController: XNBaseEntertainmentVC {

    var cateName: String = ""
    fileprivate lazy var moreLivingVM: XNMoreLivingVM = XNMoreLivingVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - 发送网络请求
    override func loadData() {
        baseVM = self.moreLivingVM
        moreLivingVM.cate = cateName
        moreLivingVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }

}
