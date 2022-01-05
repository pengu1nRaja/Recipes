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
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 10
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.setLeftPaddingPoints(8)
        textfield.setRightPaddingPoints(8)
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
    }
    
    private func setupConstraints() {
        view.addSubview(titleTF)
        view.addSubview(addButton)
        titleTF.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTF.heightAnchor.constraint(equalToConstant: 50),
            
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
