//
//  BaseModel.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/27.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var tag_name : String = ""
    var icon_url : String = ""
    
    override init(){
    
    }
    
    init(dict : [String :Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
