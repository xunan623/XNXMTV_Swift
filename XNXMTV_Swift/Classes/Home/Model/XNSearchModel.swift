//
//  XNSearchModel.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/7.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNSearchModel: NSObject {

    lazy var anchors: [XNSearchListModel] = [XNSearchListModel]()
    var total: Int = 0
    var items: [[String : Any]]? {
        didSet {
            guard let items1 = items else { return }
            for dict in items1 {
                anchors.append(XNSearchListModel(dict: dict))
            }
        }
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
