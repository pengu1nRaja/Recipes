//
//  RecipeDescriptionVC.swift
//  Recipes
//
//  Created by Albert Razhapov on 05.01.2022.
//

import UIKit

class RecipeDescriptionVC: UIViewController {
    
    private lazy var recipeTitleLable: UILabel = {
        let label = UILabel()
        label.text = "Название рецепта"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        setupConstraints()
        setupNavBar()
    }
    
    func setInfo(recipe: Recipe) {
        recipeTitleLable.text = recipe.title
    }
    
    private func setupConstraints() {
        view.addSubview(recipeTitleLable)
        recipeTitleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTitleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            recipeTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            recipeTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupNavBar() {
        let item = UIBarButtonItem(image: ImageConstant.back, style: .plain, target: self, action: #selector(popVC))
        navigationItem.leftBarButtonItem = item
    }
    
    @objc private func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
