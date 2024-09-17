//
//  RecipeDetailView.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 16/09/24.
//

import UIKit
import SwiftData
import SwiftUICore
import SwiftUI

struct RecipeDetailView: View {
    @Bindable var recipe: Recipe

    var body: some View {
        VStack{
        VStack(alignment: .center) {
            Text(recipe.name)
                .font(.title)
            
            
                Image(uiImage: recipe.returnUIImage())
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: 300)
                    .scaledToFit()
                       }
        
            VStack(alignment: .leading){
                Text("Cuisine : \(recipe.cuisineType)")
                    .font(.headline)
                Text("Ingredients:")
                    .font(.headline)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                Spacer()
            }.padding(.leading,-30)

            
        
       } .padding()
        .navigationBarTitle(Text(recipe.name), displayMode: .inline)
        .onAppear{
        }
    }
}
