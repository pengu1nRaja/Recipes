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
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = true
        return tableView
    }()
    
    private var name: String?
    private var recipeManager = RecipeManager.shared
    private var recipes: [Recipe]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
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
        let item = UIBarButtonItem(image: ImageConstant.addIcon, style: .plain, target: self, action: #selector(addRecipe))
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
        recipes?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = recipes?[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = recipes?[indexPath.row] else { return }
        let descriptionVC = RecipeDescriptionVC()
        descriptionVC.title = recipe.title
        descriptionVC.setInfo(recipe: recipe)
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}

extension MainVC: SettingNewValueDelegate {
    func setting(name: String) {
        let recipe = Recipe(title: name)
        recipeManager.addRecipe(recipe: recipe)
        recipes = RecipeManager.shared.getRecipes()
    }
}
