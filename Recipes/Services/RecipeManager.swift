//
//  RecipeManager.swift
//  Recipes
//
//  Created by Albert Razhapov on 05.01.2022.
//

import Foundation

class RecipeManager {
    
    static let shared = RecipeManager()
    
    private init() {}
    
    private var recipes: [Recipe] = []
    
    func getRecipes() -> [Recipe] {
        return recipes
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
}
