//
//  XNRecommendVM.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNRecommendVM: XNBaseVM {
    
    lazy var cycleModels : [XNCycleModel] = [XNCycleModel]()
    fileprivate lazy var allGroup : XNAnchorGroup = XNAnchorGroup()
    let params = ["pagenum":"4", "hotroom": "1", "__version": "1.1.7.1305", "__plat": "ios", "__channel": "appstore"]
}

extension XNRecommendVM {
    
    func requestData(finishedCallBack: @escaping () -> ()) {
        loadAnchorGroupData(isLiveData: false, URLString: "http://api.m.panda.tv/ajax_get_live_list_by_multicate", parameters: params, finishedCallback: finishedCallBack)
    }
    
    // MARK: - 请求轮播数据
    func requestCycleData(_ finishCallback : @escaping () -> ()) {
        let parameters = ["__version": "1.1.7.1305", "__plat": "ios", "__channel": "appstore"]
        XNNetworkTool.reqeust(type: .GET, urlString: "http://api.m.panda.tv/ajax_rmd_ads_get", paramters: parameters) { (result) in
            guard let dict = result as? [String : Any] else { return }
            guard let arr = dict["data"] as? [[String : Any]] else { return }
            for dict in arr {
                self.cycleModels.append(XNCycleModel(dict: dict))
            }
            finishCallback()
        }
    }
}





































