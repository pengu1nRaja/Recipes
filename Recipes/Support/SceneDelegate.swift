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
        let mainNC = createMainNavigationController()
        let purchaseNC = createPurchaseNavigationController()
        let ingredientsNC = createIngredientNavigationController()
        tabbar.viewControllers = [mainNC, purchaseNC, ingredientsNC]
        
        return tabbar
    }
    
    private func createMainNavigationController() -> UINavigationController {
        let mainVC = MainVC()
        mainVC.title = "Main"
        mainVC.tabBarItem = UITabBarItem(title: "Рецепты", image: UIImage(systemName: "house"), tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    private func createPurchaseNavigationController() -> UINavigationController {
        let purchaseVC = PurchaseVC()
        purchaseVC.title = "Purchase"
        purchaseVC.tabBarItem = UITabBarItem(title: "Список покупок", image: UIImage(systemName: "checklist"), tag: 1)
        
        return UINavigationController(rootViewController: purchaseVC)
    }
    
    private func createIngredientNavigationController() -> UINavigationController {
        let ingredientsVC = IngredientsVC()
        ingredientsVC.title = "Ingredients"
        ingredientsVC.tabBarItem = UITabBarItem(title: "Ингредиенты", image: UIImage(systemName: "text.badge.plus"), tag: 2)
        
        return UINavigationController(rootViewController: ingredientsVC)
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

