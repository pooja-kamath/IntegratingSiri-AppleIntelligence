//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 16/09/24.
//

import SwiftUI
import CoreSpotlight
import AppIntents
@main
struct RecipeBookApp: App {
    private let sceneNavigationModel: NavigationModel

    init() {
        
      let navigationModel = NavigationModel.shared
      sceneNavigationModel = navigationModel

     AppDependencyManager.shared.add(dependency: navigationModel)


      Task {
          if #available(iOS 18.0, *) {
              try await CSSearchableIndex
                  .default()
                  .indexAppEntities(Data.recipes.map(RecipeEntity.init(recipe:)))
          } else {
              // Fallback on earlier versions
          }
      }
    }

    var body: some Scene {
      WindowGroup {
          RecipeListView()
          .environment(sceneNavigationModel)
      }
      .modelContainer(for: [Recipe.self])
    }
    
}

