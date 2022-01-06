//
//  AddRecipeVC.swift
//  Recipes
//
//  Created by Albert Razhapov on 05.01.2022.
//

import UIKit

class AddRecipeVC: UIViewController {
    
    private lazy var titleTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите название рецепта"
        textfield.layer.cornerRadius = 10
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.setLeftPaddingPoints(8)
        textfield.setRightPaddingPoints(8)
        textfield.returnKeyType = .done
        return textfield
    }()
    
    private lazy var ingredientTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Введите ингредиента"
        textfield.layer.cornerRadius = 10
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.setLeftPaddingPoints(8)
        textfield.setRightPaddingPoints(8)
        textfield.returnKeyType = .done
        return textfield
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    var delegate: SettingNewValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupConstraints()
        addButtonAction()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupConstraints() {
        view.addSubview(titleTF)
        view.addSubview(addButton)
        view.addSubview(ingredientTF)
        titleTF.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        ingredientTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleTF.heightAnchor.constraint(equalToConstant: 40),
            
            ingredientTF.topAnchor.constraint(equalTo: titleTF.bottomAnchor, constant: 16),
            ingredientTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ingredientTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ingredientTF.heightAnchor.constraint(equalToConstant: 40),
            
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addButtonAction() {
        addButton.addTarget(self, action: #selector(addRecipe), for: .touchUpInside)
    }
    
    @objc private func addRecipe() {
        if let title = titleTF.text {
            delegate?.setting(name: title)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
}
