//
//  CustomTabBarController.swift
//  Custom-TabBar
//
//  Created by braindamage on 2021/8/5.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           print(tabBar.subviews)
       }
    
       override func viewDidLoad() {
           super.viewDidLoad()
           let tabbar = UITabBar.appearance()
        tabbar.tintColor = .systemBlue
           
           // 添加子控制器
           addChildViewControllers()
       }
       
       /// 添加子控制器
       func addChildViewControllers() {
           setChildViewController(UIViewController(), title: "首页", imageName: "house", selectedImageName: "house.fill")
           setChildViewController(UIViewController(), title: "商城", imageName: "cart", selectedImageName: "cart.fill")
           setChildViewController(UIViewController(), title: "通知", imageName: "message", selectedImageName: "message.fill")
           setChildViewController(UIViewController(), title: "我的", imageName: "person.circle", selectedImageName: "person.circle.fill")
           // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
           setValue(CustomTabBar(), forKey: "tabBar")
       }
       
       /// 初始化子控制器
       func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
           // 设置 tabbar 文字和图片
            let config = UIImage.SymbolConfiguration(scale: .large)
           childController.tabBarItem.image = UIImage(systemName: imageName,withConfiguration: config)
            childController.tabBarItem.selectedImage = UIImage(systemName: selectedImageName,withConfiguration: config)
            
           childController.title = title
           // 添加导航控制器为 TabBarController 的子控制器
           let navVc = UINavigationController(rootViewController: childController)
           addChild(navVc)
       }




}
