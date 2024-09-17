//
//  RecipeCreationView.swift
//  RecipeBook
//
//  Created by Taskeen Ashraf on 05/07/2023.
//

import SwiftUI

struct RecipeCreationView: View {
    @Binding var isPresented: Bool
       var onSave: (Recipe) -> Void
       @State private var recipeName = ""
       @State private var ingredients = ""
       @State private var selectedImagePath: String? = "nophoto"
       @State private var showImagePicker = false
    @State private var selectedCuisine = Cuisine.Chinese

    

    var body: some View {
        NavigationView {
                    Form {
                        Section(header: Text("Recipe Details")) {
                            TextField("Recipe Name", text: $recipeName)
                            TextField("Ingredients (comma-separated)", text: $ingredients)
                            Picker("Select type of Cuisine", selection: $selectedCuisine) {
                                ForEach(Cuisine.allCases, id: \.self) { option in
                                               Text(option.rawValue)
                                           }
                                       }
                                       .pickerStyle(MenuPickerStyle())
                                       .padding()
                            Image(uiImage: (UIImage(named:selectedImagePath!))!)
                                .resizable()
                                .frame(width:500,height: 300)
                                .scaledToFit()
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Pick Image")
                            }
                        }
                        
                        Button(action: saveRecipe) {
                            Text("Add")
                        }
                    }
                    .navigationTitle("Create Recipe")
                    .navigationBarItems(trailing: Button("Cancel", action: cancelCreation))
                    .sheet(isPresented: $showImagePicker, onDismiss: nil) {
                        ImagePicker(imagePath: $selectedImagePath)
                    }
                }
    }

    func saveRecipe() {
        let ingredientsArray = ingredients
                   .split(separator: ",")
                   .map { String($0.trimmingCharacters(in: .whitespaces)) }

        let recipe = Recipe(name: recipeName, imageName: selectedImagePath!, ingredients: ingredientsArray, cuisineType: selectedCuisine)
               onSave(recipe)
               cancelCreation()
    }

    func cancelCreation() {
        isPresented = false
    }
    
 
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var imagePath: String?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No update needed
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage,
                         let imageUrl = info[.imageURL] as? URL {
                          parent.imagePath = imageUrl.path
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

