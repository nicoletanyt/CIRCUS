//
//  RewardView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 5/9/22.
//

import SwiftUI

struct RewardView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State var recycledSelection: String = ""
    var couponsAvailable: [Coupon]
    @EnvironmentObject var uservm: UserDataStore
    @EnvironmentObject var clothesDataStore: ClothesDataStore
    @Binding var clothes: Clothes
    
    var body: some View {
        ZStack {
            VStack {
                Text("Good job for recycling or donating a clothing item!")
                    .font(.title)
                    .padding()
                Text("Thank you for your efforts!")
                .bold()
                Text("Where did you recycle your clothing?")
                    .font(.headline)
                Picker(selection: $recycledSelection) {
                    ForEach(couponsAvailable) { coupon in
                        Text(coupon.company)
                            .tag(coupon.company)
                    }
                } label: {
                    Text("Where did you recycle your clothing?")
                }
                .pickerStyle(WheelPickerStyle())
                Button {
                    saveButton()
                    uservm.saveUserInformation()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Save")
                            .bold()
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                            .font(.system(size: 24))
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15)
                    .foregroundColor(Color.white)
                }
                Text("Note: This Clothing Item will be removed from your closet once you press save.")
                    .foregroundColor(Color.red)
                    .bold()
                    .padding()
            }
        }
        .background(
            Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK"))
//                .resizable())
    }
}

extension RewardView {
    func saveButton() {
        guard let indexOfCoupon = allCoupon.firstIndex(where: {$0.company == recycledSelection}) else { return }
        if allCoupon[indexOfCoupon].typeForBadge == "Recycling" {
            uservm.user.itemsRecycled += 1
        } else {
            uservm.user.itemsDonated += 1
        }
        let index = clothesDataStore.clothes.firstIndex(of: clothes)
        clothesDataStore.clothes.remove(at: index!)
        clothesDataStore.saveClothes()
    }
}

//struct RewardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RewardView()
//    }
//}
