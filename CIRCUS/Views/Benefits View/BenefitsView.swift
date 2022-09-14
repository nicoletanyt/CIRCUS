//
//  RecyclingView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct BenefitsView: View {
    @State var showWebView = false
    @Environment(\.colorScheme) var colorScheme
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(filteredCoupons) { coupon in
                        Link(destination: URL(string: coupon.link)!, label: {
                            CouponDisplayItem(coupon: coupon)
                        })
                        .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    }
                    Text("You may click on these logos to visit their website for more details.")
                        .foregroundColor(Color.gray)
                        .font(.system(.caption))
                }
                .searchable(text: $searchText, prompt: "Search for coupons")
                .navigationTitle("Benefits")
            }
            .background(
                Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                    .resizable())
        }
        
    }
    var filteredCoupons: [Coupon] {
        if searchText.isEmpty {
            return allCoupon
        } else {
            return allCoupon.filter {$0.company.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

struct RecyclingView_Previews: PreviewProvider {
    static var previews: some View {
        BenefitsView()
    }
}
