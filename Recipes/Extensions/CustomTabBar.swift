//
//  CustomTabBar.swift
//  Recipes
//
//  Created by Albert Razhapov on 06.01.2022.
//

import UIKit

class CustomTabBar: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setupMiddleButton()
    }

    func setupMiddleButton() {
        let tabBarHeight = 64
        let menuButton = UIButton(type: .custom)
        menuButton.frame = CGRect(
            origin: CGPoint(x: 0.0, y: 0.0),
            size: CGSize(width: tabBarHeight, height: tabBarHeight))
        menuButton.center = CGPoint(x: view.center.x, y: view.frame.size.height - tabBar.layer.bounds.height/2)
        let menuButtonFrame = menuButton.frame
        menuButton.frame = menuButtonFrame
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor

        menuButton.tintColor = .selecteTintColor
        menuButton.backgroundColor = UIColor.systemBackground
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)

        menuButton.setImage(ImageConstant.addIcon, for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

        view.layoutIfNeeded()
    }


    // MARK: - Actions

    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
    }

}
