//
//  AddNewRecentView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 14/9/22.
//

import SwiftUI

struct AddNewRecentView: View {
    @EnvironmentObject var clothesManager: ClothesDataStore
    @EnvironmentObject var clothesWornManager: ClothesWornDataStore
    @Environment(\.presentationMode) var presentationMode
    @State var selectedDate: Date = Date()
    @State var selectedClothes: Clothes = ClothesDataStore().clothes.first!
    
    var body: some View {
        Form {
            Section {
                List() {
                    ForEach(clothesManager.clothes) { item in
                        Button {
                            selectedClothes = item
                        } label: {
                            HStack {
                                ClothingItemView(item: item)
                                Image(systemName: selectedClothes == item ? "checkmark.square" : "")
                            }
                        }
                    }
                }
            } header: {
                Text("Select your recently worn clothing item.")
            }
            Section {
                DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } header: {
                Text("Select the date that you wore this clothing item.")
            }
            Button {
                presentationMode.wrappedValue.dismiss()
                let clothe = Clothes(name: selectedClothes.name, size: selectedClothes.size, brand: selectedClothes.brand, recentlyWorn: selectedDate)
                clothesWornManager.addWornClothes(clothe)
            } label: {
                Text("Save")
            }
        }
    }
}

struct AddNewRecentView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecentView()
    }
}
