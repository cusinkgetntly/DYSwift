//
//  FunnyVC.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class FunnyVC: BaseAnchorVC {

    fileprivate lazy var funnyVM : FunnyVM = FunnyVM()
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

extension FunnyVC {
    override func setupUI() {
        super.setupUI()
        //        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.headerReferenceSize = CGSize.zero
        //        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)//设置内边距
    }
}


extension FunnyVC {
    override func loadData() {
        baseVM = funnyVM
        funnyVM.requestData {
            self.collectionView.reloadData()
            
            var tempGroups = self.funnyVM.anchorGroups
            tempGroups.removeFirst()
            self.menuView.groups = tempGroups
            
            self.loadDataFinished()
        }
    }
}

