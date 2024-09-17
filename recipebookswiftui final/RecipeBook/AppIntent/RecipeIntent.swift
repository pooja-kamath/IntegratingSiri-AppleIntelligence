//
//  RecipeIntent.swift
//  RecipeBook
//
//  Created by Pooja Kamath on 17/09/24.
//
import AppIntents

struct RecipeIntent: AppIntent, OpenIntent {
  static let title: LocalizedStringResource = "Open Recipe"

  @Parameter(title: "Recipe")
    var target: RecipeEntity

  func perform() async throws -> some IntentResult {
      await NavigationModel.shared.navigate(toSessionId: target)
    return .result()
  }

  static var parameterSummary: some ParameterSummary {
    Summary("Open Recipe for\(\.$target)")
  }
}
