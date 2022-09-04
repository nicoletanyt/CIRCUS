//
//  RecyclingView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct RecyclingView: View {
    @State var showWebView = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
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
            .background(
                Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                    .resizable())
        }
        
    }
}

//struct RecyclingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecyclingView()
//    }
//}
