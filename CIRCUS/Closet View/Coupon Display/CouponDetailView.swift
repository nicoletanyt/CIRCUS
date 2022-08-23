//
//  CouponDetailView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 12/8/22.
//

import SwiftUI

struct CouponDetailView: View {
    @State var coupon: Coupon
    var body: some View {
        Text(coupon.name)
        Text(coupon.company)
    }
}

//struct CouponDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponDetailView()
//    }
//}
