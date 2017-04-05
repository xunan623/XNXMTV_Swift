//
//  XNCycleModel.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNCycleModel: NSObject {
    var title : String = ""
    var smallimg : String = ""
    var bigimg : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
