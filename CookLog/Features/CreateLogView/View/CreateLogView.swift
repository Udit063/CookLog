//
//  CreateLog.swift
//  CookLog
//
//  Created by rentamac on 3/9/26.
//

import SwiftUI
import PhotosUI

struct CreateLogView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var steps: [String] = ["Step 1"]
    @State private var selectedImage: UIImage?
    @State private var selectedPhoto: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Image")) {
                    
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    }
                    
                    PhotosPicker(selection: $selectedPhoto, matching: .images){
                        Label("Select Iamge", systemImage: "photo")
                    }
                }
                
                Section(header: Text("Title")){
                    TextField("Title", text: $title)
                }
                    
                Section(header: Text("Description")) {
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Steps")) {
                    ForEach(steps.indices, id: \.self) {index in
                        HStack {
                            TextField("Step \(index + 1)", text: $steps[index])
                            
                            if index > 0 {
                                Button {
                                    steps.remove(at: index)
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        
                    }
                    
                    Button{
                        steps.append("")
                    } label: {
                        Label("Add Step", systemImage: "plus.circle")
                    }
                }
                
                Section {
                    Button {
                        print("Title:", title)
                        print("Description:", description)
                        print("Steps:", steps)
                    } label: {
                        Text("Create Log")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .background(.blue)
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
                        selectedImage = uiImage
                    }
                }
            }
        }
    }
}

#Preview {
    CreateLogView()
}
