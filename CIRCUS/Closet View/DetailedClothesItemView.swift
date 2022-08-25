//
//  DetailedClothesItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 22/8/22.
//

import SwiftUI

struct DetailedClothesItemView: View {
    
    @Binding var clothes: Clothes
    
    //Picker
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    clothes.image?
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                } header: {
                    Text("Image")
                }
                Section {
                    TextField("Edit clothing type", text: $clothes.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }header: {
                    Text("Name")
                }
                Section {
                    TextField("Edit Brand", text: $clothes.brand)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }header: {
                    Text("Brand")
                }

                Section {
                    HStack {
                        Text("Current Size: ")
                        Picker("Edit size", selection: $clothes.size) {
                            ForEach(sizeOptions, id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                } header: {
                    Text("Size")
                }
                Section {
                    CouponView()
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Clothing Item")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailedClothesItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedClothesItemView()
//    }
//}
