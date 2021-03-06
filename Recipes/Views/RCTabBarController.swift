//
//  CustomTabBarController.swift

import UIKit

protocol RCTabBarControllerDelegate {
    func presentViewController()
}

class RCTabBarController: UITabBarController {

    private enum Constants {
        static let titleRecipe = "Рецепты"
        static let titlePurchase = "Список покупок"
        static let titleIngredients = "Ингредиенты"
        static let titleSettings = "Настройки"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = .systemBlue
        addChildViewControllers()
        configureTabBar()
    }
    
    private func addChildViewControllers() {
        setChildViewController(MainVC(), title: Constants.titleRecipe, imageName: "house", selectedImageName: "house.fill")
        setChildViewController(PurchaseVC(), title: Constants.titlePurchase, imageName: "book", selectedImageName: "book.fill")
        setChildViewController(IngredientsVC(), title: Constants.titleIngredients, imageName: "list.bullet.circle", selectedImageName: "list.bullet.circle.fill")
        setChildViewController(UIViewController(), title: Constants.titleSettings, imageName: "gearshape", selectedImageName: "gearshape.fill")
        
        let rcTabBar = RCTabBar()
        rcTabBar.rcDelegate = self
        
        setValue(rcTabBar, forKey: "tabBar")
    }
    
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let config = UIImage.SymbolConfiguration(scale: .large)
        childController.tabBarItem.image = UIImage(systemName: imageName,withConfiguration: config)
        childController.tabBarItem.selectedImage = UIImage(systemName: selectedImageName,withConfiguration: config)
        
        childController.title = title
        let navVc = UINavigationController(rootViewController: childController)
        addChild(navVc)
    }
    
    private func configureTabBar() {
        UITabBar.appearance().backgroundColor = .systemBackground
    }
    
}

extension RCTabBarController: RCTabBarControllerDelegate {
    
    // MARK: - RCTabBarControllerDelegate
    
    func presentViewController() {
        let appendVC = AppendVC()
        appendVC.modalPresentationStyle = .overFullScreen
        appendVC.modalTransitionStyle = .crossDissolve
        present(appendVC, animated: true)
    }
}
