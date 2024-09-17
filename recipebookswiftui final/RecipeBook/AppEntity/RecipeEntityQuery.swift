//
//  RecipeEntityQuery.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 17/09/24.
//

import AppIntents
import Foundation

struct RecipeEntityQuery: EntityQuery {

    func entities(for identifiers: [UUID]) async throws -> [RecipeEntity] {
        return Data.recipesEntity.filter { identifiers.contains($0.id) }
        }
  
    func suggestedEntities() async throws -> [RecipeEntity] {
        return Data.recipesEntity
    }
}
