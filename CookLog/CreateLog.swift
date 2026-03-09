//
//  CreateLog.swift
//  CookLog
//
//  Created by rentamac on 3/9/26.
//

import SwiftUI

struct CreateLog: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var steps: [String] = ["Step 1"]
    
    var body: some View {
        NavigationView {
            Form {
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
                            
                            Button {
                                steps.remove(at: index)
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray)
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
        }
    }
}

#Preview {
    CreateLog()
}
