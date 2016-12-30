//
//  FunnyVM.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class FunnyVM: BaseVM {
    
}

extension FunnyVM {
    func requestData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=393b245e8046605f6f881d415949494c",finishedCallback: finishedCallback)
    }
}
