//
//  RecyclingView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct RecyclingView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(allCoupon) { coupon in
                    NavigationLink {
                        //web view to the link
                    } label: {
                        CouponDisplayItem(coupon: coupon)
                    }
                }
            }
            .navigationTitle("Benefits")
        }
        
    }
}

//struct RecyclingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecyclingView()
//    }
//}
