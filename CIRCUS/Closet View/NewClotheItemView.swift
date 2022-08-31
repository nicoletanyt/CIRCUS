//
//  NewClotheItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 31/7/22.
//

import SwiftUI

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

struct NewClotheItemView: View {
    
    @Binding var clothes: [Clothes]
    @Environment(\.presentationMode) var presentationMode
    
    //Text Field for Name
    @State var clothesName = ""
    
    //Text field for brand
    @State var brandName = ""
    
    //Picker
    @State var sizeSelection: String = "M"
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    //photo
    @State var showImagePicker: Bool = false
    @State var imageButtonPressed: Bool = false
    @State private var image = UIImage()
    @State var takePhoto: Bool = false
    
    var body: some View {
        Form {
            //Name text field
            Section{
                HStack {
                    Image(systemName: "tshirt.fill")
                        .foregroundColor(Color.blue)
                    TextField("Enter the clothing type", text: $clothesName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        clothesName = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.red)
                    }
                }
            } header: {
                Text("Clothing Type")
            }
            //Brand text field
            Section {
                HStack {
                    Image(systemName: "bag.fill")
                        .foregroundColor(Color.blue)
                    TextField("Enter the brand name", text: $brandName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        brandName = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color.red)
                    }
                }
            } header: {
                Text("Brand")
            }
            //Size Selection Picker View
            Section {
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
            } header: {
                Text("Size Picker")
            }
            
            Section {
                //Upload the image
                Button {
                    self.takePhoto = false
                    self.showImagePicker.toggle()
                    self.imageButtonPressed.toggle()
                } label: {
                    HStack{
                        Text("Upload Image")
                        Image(systemName: "photo")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
            } header: {
                Text("Upload Image")
            } footer: {
                Text("Scroll down to view a preview of the photo")
            }
            Section {
                //take photo
                Button {
                    self.takePhoto = true
                    self.showImagePicker.toggle()
                    self.imageButtonPressed.toggle()
                } label: {
                    HStack{
                        Text("Take Photo")
                        Image(systemName: "camera.fill")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(15)
            } header: {
                Text("Take a photo")
            }
            Divider()
            Section {
                //Show image
                Image(uiImage: self.image)
                    .resizable().scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 120, height: 120)
                    .padding()
            } header: {
                Text("Image Preview")
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: self.$image, sourceType: takePhoto ? .camera : .photoLibrary)
        }
        
        //Save Item Button
        Button("Save Item") {
            if (imageButtonPressed == false) {
                clothes.append(Clothes(name: clothesName, size: sizeSelection, imageString: "", brand: brandName))
            } else {
                clothes.append(Clothes(name: clothesName, size: sizeSelection, imageString: self.image.toPngString()!, brand: brandName))
            }
            presentationMode.wrappedValue.dismiss()
        }
        .padding()
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(15)
    }
}

//struct NewClotheItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewClotheItemView()
//    }
//}
