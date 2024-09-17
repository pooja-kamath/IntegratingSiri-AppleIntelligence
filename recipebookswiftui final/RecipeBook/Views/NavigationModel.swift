//
//  NavigationModel.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 17/09/24.
//

import Foundation
import Observation
import SwiftUI

@MainActor
@Observable
class NavigationModel : ObservableObject{

    static let shared = NavigationModel(selectedCollection: Data.recipes)

    /// The selected item in `SidebarColumn`.
    var selectedCollection: [Recipe]?

    /// The selected item in the `NavigationSplitView` content view.
    var selectedSession: Recipe?

    /// The column visibility in the `NavigationSplitView`.
    var columnVisibility: NavigationSplitViewVisibility

    init(selectedCollection: [Recipe]?=Data.recipes, columnVisibility: NavigationSplitViewVisibility = .all) {
        self.selectedCollection = selectedCollection
        self.columnVisibility = columnVisibility
    }

    func navigate(toSessionId: RecipeEntity) {
        // Update the collection and selected session
        self.selectedCollection = Data.recipes
        self.selectedSession = Data.recipes.first(where: { $0.name == toSessionId.name })
       
    }
}

