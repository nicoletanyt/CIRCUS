//
//  RecyclingView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct RecyclingView: View {
    @State var showWebView = false
//    @Binding var urlString: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allCoupon) { coupon in
                    Link(destination: URL(string: coupon.link)!, label: {
                        CouponDisplayItem(coupon: coupon)
                    })
                    .foregroundColor(Color.black)
                }
            }
            .navigationTitle("Recycling")
        }
        
    }
}

//struct RecyclingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecyclingView()
//    }
//}
