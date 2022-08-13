//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var home = ""
    
    var body: some View {
        NavigationView {
            Form {
                Image("SHIRT")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .frame(maxWidth: .infinity, alignment: .center)
                Section {
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color.gray)
                        TextField("Enter your home location", text: $home)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button {
                            //Shows details explaining why they have to key in their house location
                            
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Section {
                    CouponView()
                }
            }
            .navigationTitle("Your Profile")
        }
    }
}

struct CouponView: View {
    
    //Coupons Information
    var coupons: [Coupon] = [Coupon(name: "$30 off per piece", company: "H&M", type: "Recycling"), Coupon(name: "$20 discount", company: "LEVI'S", type: "Donate")]
    var couponsRecycling: [Coupon] { coupons.filter( {$0.type.localizedStandardContains("Recycling")} )}
    var couponsDonate: [Coupon] { coupons.filter( {$0.type.localizedStandardContains("Donate")} )}
    
    var body: some View {
        List {
            Section {
                ForEach(couponsRecycling) { coupon in
                    NavigationLink {
                        CouponDetailView(coupon: coupon)
                    } label: {
                        CouponDisplayItem(coupon: coupon)
                    }
                }
            } header: {
                Text("Recycling")
            }
            Spacer()
            Section {
                ForEach(couponsDonate) { coupon in
                    NavigationLink {
                        CouponDetailView(coupon: coupon)
                    } label: {
                        CouponDisplayItem(coupon: coupon)
                    }
                }
            } header: {
                Text("Recycling")
            }
        }
    }
}

struct CouponDisplayItem: View {
    
    @State var coupon: Coupon
    
    var body: some View {
        HStack {
            Image(companyLogos[coupon.company]!)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .leading)
                .padding()
            VStack {
                Text(coupon.name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(coupon.company)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//
