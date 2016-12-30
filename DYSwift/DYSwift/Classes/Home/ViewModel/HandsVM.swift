//
//  HandsVM.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class HandsVM: BaseVM {
    
}

extension HandsVM {
    func requestData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=3e760da75be261a588c74c4830632360", finishedCallback: finishedCallback)
    }
}
