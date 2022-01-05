//
//  MainVC.swift
//  Recipes
//
//  Created by Меньков Д.В. on 05.01.2022.
//

import UIKit

protocol SettingNewValueDelegate {
    func setting(name: String)
}

class MainVC: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let reuseIdentifier = "reuseIdentifier"
    }
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var name: String?
    private var recipeManager = RecipeManager.shared
    private var recipes = RecipeManager.shared.getRecipes()
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        setupTableView()
        setupNavBar()
    }
    
    // MARK: - Setups
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.frame = view.bounds
    }
    
    private func setupNavBar() {
        let item = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addRecipe))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc private func addRecipe() {
        let addVC = AddRecipeVC()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row].title
        
        return cell
    }
}

extension MainVC: SettingNewValueDelegate {
    func setting(name: String) {
        let recipe = Recipe(title: name)
        recipeManager.addRecipe(recipe: recipe)
        tableView.reloadData()
    }
}
