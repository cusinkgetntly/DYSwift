//
//  CollectionGameCell.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var game : BaseModel? {
        didSet {
            //注意 label需要加高度约束，不然图标约束会相对于标签约束计算不准确
            titleLabel.text = game?.tag_name
            //不能使用强制解包策略
            if let iconURL = URL(string: game?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "home_column_more")//home_more_btn
            }
            //            let iconURL = URL(string: game?.icon_url ?? "")!
            //            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "home_more_btn"))
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
