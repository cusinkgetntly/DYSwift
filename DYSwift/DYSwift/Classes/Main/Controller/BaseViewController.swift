//
//  BaseViewController.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/21.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView : UIView?
    
    fileprivate lazy var animImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named:"img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named:"img_loading_1")!, UIImage(named:"img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension BaseViewController{
    func setupUI(){
        contentView?.isHidden = true
        view.addSubview(animImageView)
        animImageView.startAnimating()
        view.backgroundColor = UIColor(red:250,green:250,blue:250,alpha:1)
    }
    
    func loadDataFinished(){
        animImageView.stopAnimating()
        animImageView.isHidden = true
        contentView?.isHidden = false
    }
}
