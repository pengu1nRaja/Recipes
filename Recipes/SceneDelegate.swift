//
//  SceneDelegate.swift
//  Recipes
//
//  Created by Albert Razhapov on 05.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }
    
    private func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .systemBackground
        let mainVC = createMainNavigationController()
        let purchaseVC = createPurchaseNavigationController()
        tabbar.viewControllers = [mainVC, purchaseVC]
        
        return tabbar
    }
    
    private func createMainNavigationController() -> UINavigationController {
        let mainVC = RCMainVC()
        mainVC.title = "Main"
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    private func createPurchaseNavigationController() -> UINavigationController {
        let purchaseVC = RCPurchaseVC()
        purchaseVC.title = "Purchase"
        purchaseVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        return UINavigationController(rootViewController: purchaseVC)
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }


}

