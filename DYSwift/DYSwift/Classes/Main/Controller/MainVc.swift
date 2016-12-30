//
//  MainVc.swift
//  DYSwift
//
//  Created by xuchaoqi on 2016/12/21.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit

class MainVc: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addChildVc(storyName: "Home")
//        addChildVc(storyName: "Live")
//        addChildVc(storyName: "Video")
//        addChildVc(storyName: "Follow")
//        addChildVc(storyName: "Profile")
        
        addChildVc(childViewController: HomeViewController(), title: "首页", imageName: "tabHome")
        addChildVc(childViewController: FollowViewController(), title: "关注", imageName: "tabFocus")
        addChildVc(childViewController: LiveViewController(), title: "直播", imageName: "tabLiving")
        addChildVc(childViewController: ProfileViewController(), title: "我的", imageName: "tabMine")
        addChildVc(childViewController: VideoViewController(), title: "视频", imageName: "tabVideo")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    private func addChildVc(storyName:String){
//        let childVc = UIStoryboard(name:storyName,bundle:nil).instantiateInitialViewController()!
//        addChildViewController(childVc)
//    }
    
    private func addChildVc(childViewController:UIViewController,title:String,imageName:String){
        tabBar.tintColor = UIColor.orange
        childViewController.tabBarItem.image = UIImage(named:imageName)
        childViewController.tabBarItem.selectedImage = UIImage(named:imageName + "HL")
        childViewController.title = title
        
        let nav = UINavigationController(rootViewController : childViewController)
        
        addChildViewController(nav)
        
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
