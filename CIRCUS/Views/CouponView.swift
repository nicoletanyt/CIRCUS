//
//  CouponView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

struct CouponView: View {
    
    @Binding var clothes: Clothes
    var couponsAvailable: [Coupon]
    
    var body: some View {
        List {
            ForEach(couponsAvailable) { coupon in
                Link(destination: URL(string: coupon.link)!, label: {
                    CouponDisplayItem(coupon: coupon)
                })
                .foregroundColor(Color.black)
            }
        }
    }
}

//struct CouponView_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponView()
//    }
//}
