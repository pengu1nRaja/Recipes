//
//  MainVC.swift
//  Recipes
//
//  Created by Меньков Д.В. on 05.01.2022.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let reuseIdentifire = "reuseIdentifire"
    }
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
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
        navigationController?.pushViewController(addVC, animated: true)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath)
        cell.textLabel?.text = "cell"
        
        return cell
    }
}
