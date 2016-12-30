//
//  GameVC.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class GameVC: BaseAnchorVC {
    
    fileprivate lazy var gameVM : GameVM = GameVM()
    fileprivate lazy var menuView : MenuView = {
        let menuView = MenuView.menuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        return menuView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GameVC {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)//设置内边距
    }
}

extension GameVC{
    override func loadData() {
        baseVM = gameVM
        gameVM.requestData {
            self.collectionView.reloadData()
            var gameGroups = Array(self.gameVM.anchorGroups[1...15])//0...15 & gameGroups.removeFirst()
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多分类"
            gameGroups.append(moreGroup)
            self.menuView.groups = gameGroups
            self.loadDataFinished()
        }
    }
}
