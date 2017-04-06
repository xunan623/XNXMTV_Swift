//
//  XNCollectionCycleCell.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/6.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

class XNCollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cycleModel : XNCycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.bigimg ?? "")!
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "homepage_refresh_tv"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
