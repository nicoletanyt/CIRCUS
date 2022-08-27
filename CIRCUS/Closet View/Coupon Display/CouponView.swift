//
//  CouponView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

struct CouponView: View {
    
    @Binding var clothes: Clothes
    
    var couponsAvailable: [Coupon] {
        forAllItems + forCertainBrands.filter( {clothes.brand.localizedStandardContains($0.company)} ) + forCertainItems.filter( {
            $0.clothingType.contains(where: {
                $0.range(of: clothes.name, options: .caseInsensitive) != nil
            })
        }
        )
    }
    
    var body: some View {
        return List {
            ForEach(couponsAvailable) { coupon in
                NavigationLink {
                    //web view to the link
                } label: {
                    CouponDisplayItem(coupon: coupon)
                }
            }
        }
    }
}

//struct CouponView_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponView()
//    }
//}
