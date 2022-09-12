//
//  DetailedClothesItemView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 2/9/22.
//

import SwiftUI

struct DetailedClothesItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var clothes: Clothes
    @EnvironmentObject var imagevm: ImageViewModel
    @State var showSheet = false
    
    var couponsAvailable: [Coupon] {
        forAllItems + forCertainBrands.filter( {clothes.brand.localizedStandardContains($0.company)} ) + forCertainItems.filter( {
            $0.clothingType.contains(where: {
                $0.range(of: clothes.name, options: .caseInsensitive) != nil
            })
        }
        )
    }
    
    //Picker
    let sizeOptions: [String] = ["XS", "S", "M", "L", "XL", "XXL"]
    
    var body: some View {
        ZStack {
            Form {
                Section {
                    if let keyOfImageIndex =  imagevm.clothesImages.firstIndex(where: {clothes.name == $0.name}) {
                        Image(uiImage: imagevm.clothesImages[keyOfImageIndex].image)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .leading)
                            .clipShape(Circle())
                            .scaledToFit()
                    } else {
                        //if image doesn't exist
                        Image("NOT-LOADING")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .leading)
                            .clipShape(Circle())
                            .scaledToFit()
                    }
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
                    CouponView(clothes: $clothes, couponsAvailable: couponsAvailable)
                } header: {
                    Text("Coupons")
                } footer: {
                    Text("You may click on these logos to visit their website for more details.")
                }
                Section {
                    HStack {
                        Spacer()
                        Button {
                            showSheet = true
                        } label: {
                            HStack {
                                Text("Item Recycled")
                                    .bold()
                                Image(systemName: "arrow.3.trianglepath")
                                    .font(.system(size: 24))
                            }
                            .padding()
                            .background(Color.green)
                            .cornerRadius(15)
                            .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Item Details")
            .sheet(isPresented: $showSheet) {
                RewardView(couponsAvailable: couponsAvailable, clothes: $clothes)
            }
        }
        .background(
            Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                .resizable())
    }
}
//
//struct DetailedClothesItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedClothesItemView()
//    }
//}
