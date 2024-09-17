//
//  RecipeEntity.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 17/09/24.
//

import AppIntents
import UIKit

struct RecipeEntity:AppEntity,IndexedEntity
{
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
      TypeDisplayRepresentation(
        name: LocalizedStringResource("Recipe", table: "AppIntents")
      )
    }

    static var defaultQuery = RecipeEntityQuery()

    var id : UUID = UUID()
    var name: String = ""
    var imageName: String
    var ingredients: [String]
    var cuisineType : Cuisine?

    var displayRepresentation: DisplayRepresentation {
      DisplayRepresentation(
        title: "\(name)",
        image: DisplayRepresentation.Image(named: imageName))
    }
    
    init(recipe:Recipe)
    {
        self.id = recipe.id
        self.name = recipe.name
        self.imageName = recipe.imageName
        self.ingredients = recipe.ingredients
        self.cuisineType = recipe.cuisineType
    }
    
}



