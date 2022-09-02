//
//  DetailedClothesItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 2/9/22.
//

import SwiftUI

struct DetailedClothesItemView: View {
    
    @State var clothes: Clothes
        
    //Picker
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    var body: some View {
        Form {
            Section {
                Image(clothes.imageString ?? "NOT-LOADING")
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
                CouponView(clothes: $clothes)
            } header: {
                Text("Coupons")
            }
            Spacer()
        }
        .navigationTitle("Edit Clothing Item")
    }
}
//
//struct DetailedClothesItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedClothesItemView()
//    }
//}
