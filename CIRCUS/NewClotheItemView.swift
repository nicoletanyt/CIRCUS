//
//  NewClotheItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 31/7/22.
//

import SwiftUI

struct NewClotheItemView: View {
    
    @Binding var clothes: [Clothes]
    @Environment(\.presentationMode) var presentationMode
    
    //Text Field for Name
    @State var clothesName = ""
    
    //Picker
    @State var sizeSelection: String = "M"
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    //photo
    @State var showImagePicker: Bool = false
    @State var imageButtonPressed: Bool = false
    @State private var image = UIImage()
    @State var takePhoto: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            //Text Field
            HStack{
                Image(systemName: "tshirt.fill")
                    .foregroundColor(Color.gray)
                TextField("Enter the clothing type", text: $clothesName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    //Clear text field
                } label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(60)
            
            //Size Selection Picker View
            HStack {
                Text("Size: ")
                Text(sizeSelection)
            }
            Picker (selection: $sizeSelection) {
                ForEach(sizeOptions, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
            } label: {
                Text("Picker")
            }
            .pickerStyle(WheelPickerStyle())
            .multilineTextAlignment(.center)
            .padding()
            
            //Image Upload
            HStack {
                HStack {
                    Button {
                        self.showImagePicker.toggle()
                        self.imageButtonPressed.toggle()
                        takePhoto = false
                    } label: {
                        Text("Upload Image")
                    }
                    Image(systemName: "photo")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
                HStack {
                    Button {
                        self.showImagePicker.toggle()
                        self.imageButtonPressed.toggle()
                        takePhoto = true
                    } label: {
                        Text("Take Photo")
                    }
                    Image(systemName: "camera.fill")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
            }
            .padding()
            
            Image(uiImage: self.image)
                .resizable().scaledToFit()
                //.frame(width: 200, height: 200, alignment: .center)
                .padding()
            
            //Save Item Button
            Button("Save Item") {
                if (imageButtonPressed == false) {
                    clothes.append(Clothes(name: clothesName, size: sizeSelection, image: nil))
                } else {
                    clothes.append(Clothes(name: clothesName, size: sizeSelection, image: Image(uiImage:self.image)))
                }
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            Spacer()
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .sheet(isPresented: $showImagePicker) {
            if takePhoto {
                ImagePicker(selectedImage: self.$image, sourceType: .camera)
            } else {
                ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            }
        }
    }
}

//struct NewClotheItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewClotheItemView()
//    }
//}
