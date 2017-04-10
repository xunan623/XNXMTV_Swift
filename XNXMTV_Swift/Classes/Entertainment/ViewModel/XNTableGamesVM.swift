//
//  XNTableGamesVM.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/10.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNTableGamesVM: XNBaseVM {
    func requestData(finishedCallback : @escaping () -> ()) {
        loadAnchorGroupData(isLiveData: true, URLString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=boardgames&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore", finishedCallback: finishedCallback)
    }
}
