//
//  XNGameVM.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNGameVM: NSObject {
    lazy var gameArray: [XNGameModel] = [XNGameModel]()
    func loadgGameData(finishedCallback : @escaping () -> ()) {
        XNNetworkTool.reqeust(type: .GET,
                              urlString: "http://api.m.panda.tv/index.php",
                              paramters: ["method":"category.list", "type":"game", "__version":"1.1.7.1305", "__plat":"ios", "__channel":"appstore"]) { (result) in
            guard let resultDict = result as? [String: NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            for dict in dataArray {
                self.gameArray.append(XNGameModel(dict: dict))
            }
        }
    }
}
