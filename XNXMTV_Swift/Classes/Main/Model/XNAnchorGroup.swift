//
//  XNAnchorGroup.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNAnchorGroup: NSObject {

    lazy var anchors: [XNLivelistModel] = [XNLivelistModel]()
    var type: XNTypeModel?
    var total: Int = 0
    var items: [[String : Any]]? {
        didSet {
            guard let items1 = items else { return }
            for dict in items1 {
                anchors.append(XNLivelistModel(dict: dict))
            }
        }
    }
    
    override init() {}
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    
}
