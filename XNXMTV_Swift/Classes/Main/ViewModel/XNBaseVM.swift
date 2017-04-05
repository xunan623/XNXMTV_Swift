//
//  XNBaseVM.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNBaseVM: NSObject {
    
    lazy var anchorGroups: [XNAnchorGroup] = [XNAnchorGroup]()
    func loadAnchorGroupData(isLiveData : Bool, URLString : String, parameters : [String : Any]? = nil, funishedCallback : @escaping () -> ()) {
        
        XNNetworkTool.reqeust(type: .GET, urlString: URLString, paramters: parameters) { (result) in
            
            guard let dict = result as? [String : Any] else { return }
            if isLiveData {
                guard let dictionary = dict["data"] as? [String : Any] else { return }
                self.anchorGroups.append(XNAnchorGroup(dict: dictionary))
            } else {
                guard let arr = dict["data"] as? [[String : Any]] else { return }
                for dict in arr {
                    self.anchorGroups.append(XNAnchorGroup(dict: dict))
                }
            }
            funishedCallback()
            
        }
        
    }

}
