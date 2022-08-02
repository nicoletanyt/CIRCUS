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
    @State var selectedImage: Image? = Image("") //show selected image
    
    var body: some View {
        VStack {
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
            .padding(40)
            
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
            Button {
                self.showImagePicker.toggle()
            } label: {
                Text("Upload Image")
            }
            self.selectedImage?.resizable().scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
            
            //Save Item Button
            Button("Save Item") {
                clothes.append(Clothes(name: clothesName, size: sizeSelection, image: selectedImage))
                presentationMode.wrappedValue.dismiss()
            }
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$selectedImage)
        }
    }
}

//struct NewClotheItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewClotheItemView()
//    }
//}
