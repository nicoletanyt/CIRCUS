//
//  CouponView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

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
                    .bold()
            }
            Section {
                ForEach(couponsDonate) { coupon in
                    NavigationLink {
                        CouponDetailView(coupon: coupon)
                    } label: {
                        CouponDisplayItem(coupon: coupon)
                    }
                }
            } header: {
                Text("Donate")
                    .bold() 
            }
        }
    }
}

//struct CouponView_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponView()
//    }
//}
