//
//  AddEvent.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/9/25.
//

import SwiftUI
import PhotosUI

struct AddEventView: View {
    
    @Bindable private var eventViewModel = EventFormViewModel()
    
    @State private var photoSource: PhotoSource?
    @State private var showPhotoOptions = false
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var showPhotoLibrary = false
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Image("add_image")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                }
                
                Section {
                    FormTextField(label: "Event Name", placeholder: "Enter name of your event", value: $eventViewModel.title)
                    FormTextField(label: "Description", placeholder: "What is your event about?", value: $eventViewModel.description)
                }
                
                Section {
                    FormTextField(label: "Venue Name", placeholder: "What's the name of the venue?", value: $eventViewModel.title)
                    FormTextField(label: "Location", placeholder: "What's the address of the venue?", value: $eventViewModel.title)
                }
                
                Section {
                    DatePicker("Event Date", selection: $eventViewModel.date)
                }
                
            }
            .navigationTitle("Create New Event")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Welcome.orangeButtonColor)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    }label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundStyle(Welcome.orangeButtonColor)
                    }
                }
            }
        }
        .confirmationDialog("Choose Your Photo Source", isPresented: $showPhotoOptions, titleVisibility: .visible) {
            Button("Camera") {
                self.photoSource = .camera
            }
            
            Button("Photo Library") {
                self.showPhotoLibrary.toggle()
            }
        }
        .photosPicker(isPresented: $showPhotoLibrary, selection: $selectedPhoto)
        
        
        
    }
}

struct FormTextField: View {
    let label: String
    var placeholder: String = ""
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.subheadline, design: .rounded))
            
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(.systemGray), lineWidth: 1))
                .padding(.vertical, 5)
            
                
        }
    }
}

#Preview {
    AddEventView()
}

#Preview("FormTextField", traits: .fixedLayout(width: 300, height: 200)) {
    FormTextField(label: "NAME", placeholder: "Fill in the restaurant name", value: .constant(""))
}
