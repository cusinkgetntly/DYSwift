//
//  CollectionNormalCell.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class CollectionNormalCell: BaseCollectionViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    
    override var anchor: AnchorModel? {
        didSet{
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
    }
}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
