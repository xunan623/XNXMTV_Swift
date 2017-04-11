//
//  XNCollectionSubcateCell.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/3/20.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNCollectionSubcateCell: UICollectionViewCell {

    @IBOutlet weak var itemButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        itemButton.isUserInteractionEnabled = false
        itemButton.setBackgroundImage(UIImage(named: "getButton_hove"), for: .normal)
        itemButton.setTitleColor(UIColor(r: 104, g: 225, b: 182), for: .normal)
    }
    
    var subcateModel: XNGameModel? {
        didSet {
            itemButton.setTitle(subcateModel?.cname, for: .normal)
        }
    }

}
