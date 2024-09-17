//
//  Data.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 16/09/24.
//
class Data{
    static var recipes : [Recipe] = [
        Recipe(name: "Spaghetti Bolognese", imageName: "spaghetti", ingredients: ["Spaghetti", "Ground beef", "Tomato sauce", "Onion", "Garlic"], cuisineType: Cuisine.Italian),
        Recipe(name: "Chicken Stir Fry", imageName: "chickenstirfry", ingredients: ["Chicken breast", "Bell peppers", "Soy sauce", "Garlic", "Ginger"], cuisineType: Cuisine.Chinese),
        Recipe(name: "Caesar Salad", imageName: "caesarsalad", ingredients: ["Romaine lettuce", "Croutons", "Parmesan cheese", "Caesar dressing"], cuisineType: Cuisine.Thai)
    ]
    
    static var recipesEntity : [RecipeEntity] = [
        RecipeEntity(recipe: Recipe(name: "Spaghetti Bolognese", imageName: "spaghetti", ingredients: ["Spaghetti", "Ground beef", "Tomato sauce", "Onion", "Garlic"], cuisineType: Cuisine.Italian)),
        RecipeEntity(recipe: Recipe(name: "Chicken Stir Fry", imageName: "chickenstirfry", ingredients: ["Chicken breast", "Bell peppers", "Soy sauce", "Garlic", "Ginger"], cuisineType: Cuisine.Chinese)),
        RecipeEntity(recipe: Recipe(name: "Caesar Salad", imageName: "caesarsalad", ingredients: ["Romaine lettuce", "Croutons", "Parmesan cheese", "Caesar dressing"], cuisineType: Cuisine.Thai))
    ]
}
