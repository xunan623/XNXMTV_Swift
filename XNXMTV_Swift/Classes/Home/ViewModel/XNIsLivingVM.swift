//
//  XNIsLivingVM.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/11.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNIsLivingVM: XNBaseVM {
    var status: Int = 0
    var keywords: String = ""
    func requestLivingData(finishedCallback : @escaping () -> ()) {
        loadSearchData(URLString: "http://api.m.panda.tv/ajax_search?keyword=\(keywords)&pageno=1&pagenum=20&status=\(status)&__version=1.1.7.1305&__plat=ios&__channel=appstore", finishedCallback: finishedCallback)
    }
}
