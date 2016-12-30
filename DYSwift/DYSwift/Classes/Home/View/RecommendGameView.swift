//
//  RecommendGameView.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

private let GameCellID = "GameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var groups : [BaseModel]? {
        didSet {
            //            groups?.removeFirst()
            //            groups?.removeFirst()
            //            groups?.remove(at: 1)
            //            let moreGroup = AnchorGroup()
            //            moreGroup.tag_name = "更多"
            //            groups?.append(moreGroup)
            collectionView.reloadData()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        //
        autoresizingMask = UIViewAutoresizing()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: GameCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
}

extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCellID, for: indexPath) as! CollectionGameCell
        cell.game = groups![indexPath.item]
        return cell
    }
}

extension RecommendGameView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
