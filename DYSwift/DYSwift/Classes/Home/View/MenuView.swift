//
//  MenuView.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/29.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

private let menuCellId = "menuCellId"

class MenuView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var groups : [AnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellWithReuseIdentifier: menuCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
        //注意去掉xib 中Menu View 中的autosizing四条线（< 、^、 右、下、）否则下面打印的为 (0.0, 0.0, 414.0, 33.0)
        //如果不使用上面的方法，也可以使用autoresizingMask = UIViewAutoresizing() , 这条语句写在override func awakeFromNib() {中
        //        print(collectionView.bounds);//(0.0, 0.0, 414.0, 181.0) 实际大小
    }

}

extension MenuView {
    class func menuView() -> MenuView {
        return Bundle.main.loadNibNamed("MenuView", owner: nil, options: nil)?.first as! MenuView
    }
}

extension MenuView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil { return 0 }
        let pageNum = (groups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        if pageNum <= 1 {
            pageControl.isHidden = true
        }
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as! MenuViewCell
        setupCellDataWithCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func setupCellDataWithCell(cell : MenuViewCell, indexPath : IndexPath) {
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        cell.groups = Array(groups![startIndex...endIndex])
    }
}

extension MenuView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width + 0.5)
    }
}

