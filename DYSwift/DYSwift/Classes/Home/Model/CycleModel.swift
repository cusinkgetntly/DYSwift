//
//  CycleModel.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    var title : String = ""
    var pic_url : String = ""
    var anchor : AnchorModel?
    var room :[String :Any]?{
        didSet{
            guard let room = room  else {
                return
            }
            anchor = AnchorModel(dict: room)
        }
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
