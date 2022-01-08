//
//  EmptyVC.swift
//  Recipes
//
//  Created by Albert Razhapov on 06.01.2022.
//

import UIKit

class EmptyVC: UIViewController {
    
    private lazy var addView: AddView = {
        let view = AddView()
        view.backgroundColor = .secondarySystemBackground
        view.alpha = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.addView.alpha = 1
        }
    }
    
    private func setupConstraints() {
        view.addSubview(addView)
        
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addView.heightAnchor.constraint(equalToConstant: 184)
        ])
    }
}

class AddView: UIView {
    private var addRecipeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить рецепт", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        return button
    }()
    private var addIngredientButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Добавить ингредиент", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        return button
    }()
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Отменить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGroupedBackground, for: .selected)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
        setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addRecipeButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        addIngredientButton.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraint() {
        self.addSubview(addRecipeButton)
        self.addSubview(addIngredientButton)
        self.addSubview(cancelButton)
        
        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        addIngredientButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addRecipeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            addRecipeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            addRecipeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addRecipeButton.heightAnchor.constraint(equalToConstant: 40),
            
            addIngredientButton.topAnchor.constraint(equalTo: addRecipeButton.bottomAnchor, constant: 16),
            addIngredientButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            addIngredientButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            addIngredientButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.topAnchor.constraint(equalTo: addIngredientButton.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
