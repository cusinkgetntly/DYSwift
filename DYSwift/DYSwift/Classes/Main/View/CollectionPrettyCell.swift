//
//  CollectionPrettyCell.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class CollectionPrettyCell: BaseCollectionViewCell {

    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor: AnchorModel? {
        didSet{
            super.anchor = anchor
            cityBtn.setTitle(anchor?.anchor_city, for: UIControlState())
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
