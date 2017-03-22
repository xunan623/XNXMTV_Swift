//
//  XNNetworkTool.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/20.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class XNNetworkTool {
    class func reqeust(type: MethodType,
                       urlString: String,
                       paramters: [String: Any]? = nil,
                       finishedCallback: @escaping (_ reslult: Any) -> ()) {
        
        // 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "错误咯")
                return
            }
            finishedCallback(result as AnyObject)
        }
        
    }
}
