//
//  XNCollectionHeaderView.swift
//  XNXMTV_Swift
//
//  Created by xunan on 2017/4/7.
//  Copyright © 2017年 xunan. All rights reserved.
//

import UIKit

protocol  XNCollectionHeaderViewDelegate : class {
    func moreLivingList(cataName: String, titleName: String)
}

class XNCollectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var arrowBtn: UIButton!

    weak var delegate : XNCollectionHeaderViewDelegate?
    
    var total: Int? {
        didSet {
            if total! <= 4 {
                moreBtn.isHidden = true
                arrowBtn.isHidden = true
            } else {
                moreBtn.isHidden = false
                arrowBtn.isHidden = false
            }
        }
    }
    
    // MARK: - 定义模型属性
    var group : XNTypeModel? {
        didSet {
            titleLabel.text = group?.value(forKeyPath: "cname") as! String?
            guard let url = URL(string: (group?.value(forKeyPath: "icon") as! String?)!) else { return }
            iconImageView.kf.setImage(with: url, placeholder: UIImage(named: "defult_h_icon_13x13_"))
        }
    }
    
    // MARK: - 点击更多按钮
    @IBAction func moreClick(_ sender: UIButton) {
        let s1 = (group?.value(forKeyPath: "ename") as! String?)
        let s2 = titleLabel.text
        delegate?.moreLivingList(cataName: s1!, titleName: s2!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension XNCollectionHeaderView {
    class func collectionHeaderView() -> XNCollectionHeaderView {
        return Bundle.main.loadNibNamed("XNCollectionHeaderView", owner: nil, options: nil)?.last as! XNCollectionHeaderView
    }
}


























































