//
//  HandsVC.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class HandsVC: BaseAnchorVC {

    fileprivate lazy var handsVM : HandsVM = HandsVM()
    fileprivate lazy var menuView : MenuView = {
        let menuView = MenuView.menuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)//设置collectionView的-y,放置menuView
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HandsVC {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)//设置内边距
    }
}

extension HandsVC{
    override func loadData() {
        baseVM = handsVM
        handsVM.requestData {
            self.collectionView.reloadData()
            
            var tempGroups = Array(self.handsVM.anchorGroups[1...15])// 0...15 & tempGroups.removeFirst()
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多分类"
            tempGroups.append(moreGroup)
            self.menuView.groups = tempGroups
            
            self.loadDataFinished()
        }
    }
}

