//
//  NewClothesItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 1/9/22.
//

import SwiftUI

struct NewClothesItemView: View {
    
    @ObservedObject var clothesManager = ClothesManager()
    @State var clothesName = ""
    @State var brandName = ""
    @State var sizeSelection: String = "M"
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            ImagePickerViewDisplay()
                .padding()
            List {
                LabelTextField(label: "Name", placeHolder: "Enter the name of the clothing item", textFieldInput: $clothesName)
                LabelTextField(label: "Brand", placeHolder: "Enter the brand name", textFieldInput: $brandName)
                PickerView(sizeSelection: sizeSelection)
                SaveButton(clothes: $clothesManager.clothess, name: clothesName, size: sizeSelection, brand: brandName)
            }
            
            .navigationTitle("Add Clothing Item")
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
            }
        }
    }
}

struct NewClothesItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewClothesItemView()
            .environmentObject(ViewModel())
    }
}

struct LabelTextField: View {
    
    var label: String
    var placeHolder: String
    @Binding var textFieldInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(placeHolder, text: $textFieldInput)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(5.0)
            
        }
        .padding(.top)
    }
}

struct PickerView: View {
    
    @State var sizeSelection: String = "M"
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shirt Size")
                .font(.headline)
            Picker (selection: $sizeSelection) {
                ForEach(sizeOptions, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
            } label: {
                Text("Picker")
            }
            .pickerStyle(WheelPickerStyle())
        }
        .padding()
    }
}

struct ImagePickerViewDisplay: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Upload Image")
                .font(.headline)
            ImagePickerView()
        }
        .padding()
    }
}

struct RoundedButton: View {
    
    var icon: String
    var text: String
    var colour: Color?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
        .padding()
        .background(colour == nil ? Color.blue : colour)
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
}

struct SaveButton: View {
    @Binding var clothes: [Clothes]
    @EnvironmentObject var vm: ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    var size: String
    var brand: String
    
    var body: some View {
        Button {
            clothes.append(Clothes(name: name, size: size, brand: brand))
            presentationMode.wrappedValue.dismiss()
        } label: {
            RoundedButton(icon: "square.and.arrow.down.fill", text: "Save", colour: Color.green)
        }
        .padding()
    }
}

struct ImagePickerView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            if let image = vm.image {
                ZoomableScrollView {
                    Image(uiImage: image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .leading)
                }
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
                    .frame(width: 200, height: 200, alignment: .leading)
                    .padding(.horizontal)
            }
            HStack {
                Button {
                    vm.source = .camera
                    vm.showPhotoPicker()
                } label: {
                    RoundedButton(icon: "camera.fill", text: "Camera")
                }
                Button {
                    vm.source = .library
                    vm.showPhotoPicker()
                } label: {
                    RoundedButton(icon: "photo", text: "Photos")
                }
            }
        }
    }
}
