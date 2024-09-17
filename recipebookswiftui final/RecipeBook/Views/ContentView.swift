//
//  ContentView.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 17/09/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(NavigationModel.self)
  private var navigationModel

  var body: some View {
    @Bindable var navigationModel = navigationModel
    NavigationSplitView(columnVisibility: $navigationModel.columnVisibility) {
      SidebarColumn()
        .navigationSplitViewColumnWidth(min: 200, ideal: 350)
    } content: {
        RecipeListView()
    } detail: {
        RecipeDetailView(recipe: Data.recipes[0])
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
          .environment(NavigationModel(selectedCollection: Data.recipes))
      
  }
}
