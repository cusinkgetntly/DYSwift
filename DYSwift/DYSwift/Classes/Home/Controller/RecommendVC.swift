//
//  RecommendVC.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/28.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

private let kCycleViewH : CGFloat = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

class RecommendVC: BaseAnchorVC {
    
    fileprivate lazy var recommendVM : RecommendVM = RecommendVM()
    
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH+kGameViewH), width: kScreenW, height: kCycleViewH)//指定大小
        return cycleView
    }()

    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension RecommendVC {
    override func loadData() {
        baseVM = recommendVM
        //闭包对VC有强引用  VC对recommendVM有强引用 recommendVM没有对闭包有强引用 =>没有形成循环引用
        recommendVM.requestData {
            self.collectionView.reloadData()
            //二次处理
            var gameGroups = self.recommendVM.anchorGroups
            gameGroups.removeFirst()
            gameGroups.removeFirst()
            gameGroups.remove(at: 1)
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            gameGroups.append(moreGroup)
            self.gameView.groups = gameGroups
        }
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        self.loadDataFinished()
    }
}

extension RecommendVC {
    override func setupUI(){
        super.setupUI()
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        //边距是两个额外的视图
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH+kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

extension RecommendVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1{
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }else{
            return CGSize(width: kNormalItemW, height: kNormalItemH)
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrettyCellID, for: indexPath) as! CollectionPrettyCell
            cell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return cell
        }else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
}
