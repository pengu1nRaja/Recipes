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
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor

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
