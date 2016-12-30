//
//  GameVM.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class GameVM: BaseVM {
    
}

extension GameVM {
    func requestData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/homeCate/getHotRoom?client_sys=ios&identification=ba08216f13dd1742157412386eee1225", finishedCallback: finishedCallback)
    }
}
