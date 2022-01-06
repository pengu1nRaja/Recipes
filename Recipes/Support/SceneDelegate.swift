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
        configureNavigationBar()
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    private func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .secondarySystemBackground
        UITabBar.appearance().backgroundColor = .systemBackground
        let mainNC = createMainNavigationController()
        let purchaseNC = createPurchaseNavigationController()
        let ingredientsNC = createIngredientNavigationController()
        tabbar.viewControllers = [mainNC, purchaseNC, ingredientsNC]
        
        return tabbar
    }
    
    private func createMainNavigationController() -> UINavigationController {
        let mainVC = MainVC()
        mainVC.title = "Рецепты"
        mainVC.tabBarItem = UITabBarItem(title: "Рецепты", image: ImageConstant.homeIcon, tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    private func createPurchaseNavigationController() -> UINavigationController {
        let purchaseVC = PurchaseVC()
        purchaseVC.title = "Список покупок"
        purchaseVC.tabBarItem = UITabBarItem(title: "Список покупок", image: ImageConstant.purchaseIcon, tag: 1)
        
        return UINavigationController(rootViewController: purchaseVC)
    }
    
    private func createIngredientNavigationController() -> UINavigationController {
        let ingredientsVC = IngredientsVC()
        ingredientsVC.title = "Ингредиенты"
        ingredientsVC.tabBarItem = UITabBarItem(title: "Ингредиенты", image: ImageConstant.ingredientIcon, tag: 2)
        
        return UINavigationController(rootViewController: ingredientsVC)
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .secondarySystemBackground
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }


}

