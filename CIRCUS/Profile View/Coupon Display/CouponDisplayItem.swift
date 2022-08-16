//
//  CouponDisplayItem.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

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

//struct CouponDisplayItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CouponDisplayItem()
//    }
//}
