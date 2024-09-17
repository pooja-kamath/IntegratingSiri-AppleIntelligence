//
//  ContentView.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 16/09/24.
//

import SwiftUI
import SwiftData
import CoreSpotlight

struct RecipeListView: View {
    
    @State private var isAddingRecipe = false

    @Query private var recipes : [Recipe]

    @Environment(\.modelContext) private var modelContext

    @State private var searchTerm = ""
    
    var results: [Recipe] {
        searchTerm.isEmpty ? Data.recipes : Data.recipes.filter { $0.name.contains(searchTerm) }
    }
    
    var body: some View {
        @StateObject var navigationModel = NavigationModel.shared

        NavigationView {
            List {
                
                Button(action: {
                    isAddingRecipe = true
                }) {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add a Recipe")
                    }
                    .sheet(isPresented: $isAddingRecipe) {
                        RecipeCreationView(isPresented: $isAddingRecipe, onSave: addRecipe)
                    }
                }
                ForEach(results, id: \.self) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe),
                                                                 tag: recipe,
                                                                 selection: $navigationModel.selectedSession) {
                        HStack{
                            Image(uiImage: recipe.returnUIImage())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50,height: 50)
                                .cornerRadius(10)
                            Text(recipe.name)
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .task {
                do{
                    if #available(iOS 18.0, *) {
                        try await CSSearchableIndex.default().indexAppEntities(Data.recipesEntity)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                catch
                {
                    print("Error")
                }
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Recipes")
        }
   }
   
    func deleteItem(at offsets: IndexSet) {
        let deletedItems = offsets.map { recipes[$0] }
        modelContext.delete(deletedItems[0])
       }

       func addRecipe(recipe: Recipe) {
           modelContext.insert(recipe)
       }
   } 




