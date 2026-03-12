//
//  CreateLog.swift
//  CookLog
//
//  Created by rentamac on 3/9/26.
//

import SwiftUI
import PhotosUI

struct CreateLogView: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @StateObject private var viewModel = CreateLogViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Image")) {
                    
                    if let selectedImage = viewModel.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    }
                    
                    PhotosPicker(selection: $selectedPhoto, matching: .images){
                        Label("Select Image", systemImage: "photo")
                    }
                }
                
                Section(header: Text("Title")){
                    TextField("Title", text: $viewModel.title)
                }
                    
                Section(header: Text("Description")) {
                    TextField("Description", text: $viewModel.description)
                }
                
                Section(header: Text("Steps")) {
                    ForEach(viewModel.steps.indices, id: \.self) {index in
                        HStack {
                            TextField("Step \(index + 1)", text: $viewModel.steps[index])
                            
                            if index > 0 {
                                Button {
                                    viewModel.steps.remove(at: index)
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        
                    }
                    
                    Button{
                        viewModel.steps.append("")
                    } label: {
                        Label("Add Step", systemImage: "plus.circle")
                    }
                }
                
                Section {
                    Button {
                        viewModel.createRecipe(title: viewModel.title, description: viewModel.description, steps: viewModel.steps, image: viewModel.selectedImage)
                    } label: {
                        if viewModel.isCreating {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding()
                        } else {
                            Text("Create Log")
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .disabled(!viewModel.isFormValid)
                    .background(viewModel.isFormValid ? .blue : .gray)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                }
                
            }
            .navigationTitle("Create Log")
            .task(id: selectedPhoto){
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data){
                        viewModel.selectedImage = uiImage
                    }
                }
            }
        }
    }
}

#Preview {
    CreateLogView()
}
