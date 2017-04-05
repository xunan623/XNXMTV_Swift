//
//  XNCollectionGameCell.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/1.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit
import Kingfisher

class XNCollectionGameCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var gameModel: XNGameModel? {
        didSet {
            guard let iconURL = URL(string: gameModel?.img ?? "") else {
                return
            }
            imageView.kf.setImage(with: iconURL)
            nameLabel.text = gameModel?.cname
        }
    }

}
