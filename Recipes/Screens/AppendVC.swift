//
//  AppendVC.swift
//  Recipes
//
//  Created by Albert Razhapov on 06.01.2022.
//

import UIKit

class AppendVC: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.alpha = 0
        return view
    }()
    
    private lazy var addRecipeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить рецепт", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        return button
    }()
    
    private lazy var addIngredientButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить ингредиент", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        view.addGestureRecognizer(gesture)
        setupConstraints()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        containerView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.containerView.alpha = 1
        }
    }
    
    private func setupConstraints() {
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 184)
        ])
        
        containerView.addSubview(addRecipeButton)
        containerView.addSubview(addIngredientButton)
        containerView.addSubview(cancelButton)
        
        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        addIngredientButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addRecipeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            addRecipeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            addRecipeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            addRecipeButton.heightAnchor.constraint(equalToConstant: 40),
            
            addIngredientButton.topAnchor.constraint(equalTo: addRecipeButton.bottomAnchor, constant: 16),
            addIngredientButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            addIngredientButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            addIngredientButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.topAnchor.constraint(equalTo: addIngredientButton.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cancelButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupUI() {
        addRecipeButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        addIngredientButton.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
