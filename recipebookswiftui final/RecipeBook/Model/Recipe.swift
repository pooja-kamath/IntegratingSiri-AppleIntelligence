//
//  Recipe.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 16/09/24.
//
import UIKit
import SwiftData

@Model
class Recipe {
    var id : UUID = UUID()
    @Attribute(.unique) var name: String = ""
    var imageName: String
    var ingredients: [String]
    var cuisineType : Cuisine
        
    init(name: String, imageName: String, ingredients: [String],cuisineType : Cuisine) {
        self.name = name
        self.imageName = imageName
        self.ingredients = ingredients
        self.cuisineType = cuisineType
    }
    
    func returnUIImage()->UIImage{
        if let image = UIImage(named: imageName) {
            return image
        }else {
            return UIImage(named: "nophoto")!
        }
    }

}
 
