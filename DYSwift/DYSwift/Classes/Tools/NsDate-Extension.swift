//
//  NsDate-Extension.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentTime() -> String {
        return "\(NSDate().timeIntervalSince1970)"
    }
}
