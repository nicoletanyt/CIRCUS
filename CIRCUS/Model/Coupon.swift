//
//  Coupon.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 12/8/22.
//

import Foundation

struct Coupon: Identifiable, Equatable {
    var id = UUID()
    var name: String?
    var company: String //brand
    var imageString: String
    var forType: String //whether this coupon is for all companies, certain brands, or certain clothing pieces
    var clothingType: [String] = []
    var link: String
    var typeForBadge: String //either recycling or donate
}

//Data
var allCoupon = [
    Coupon(name: "15% off one item on your next purchase", company: "H&M", imageString: "H&M-LOGO", forType: "all", link: "https://www2.hm.com/en_gb/sustainability-at-hm/our-work/close-the-loop.html", typeForBadge: "Recycling"),
    Coupon(name: "S$0.20/kg of old clothing", company: "Veolia", imageString: "VEOLIA-LOGO", forType: "all", link: "https://data.gov.sg/dataset/cash-for-trash", typeForBadge: "Recycling"),
    Coupon(name: "Bring items still in great condition in exchange for points", company: "Fashion Pulpit", imageString: "THE-FASHION-PULPIT-LOGO", forType: "all", link: "https://www.thefashionpulpit.com/", typeForBadge: "Recycling"),
    Coupon(company: "Green square", imageString: "GREENSQUARE-LOGO", forType: "all", link: "https://www.greensquare.com.sg/dropoff", typeForBadge: "Donate"),
    Coupon(company: "The Salvation Army", imageString: "THE-SALVATION-ARMY-LOGO", forType: "all", link: "https://redshieldindustries.com/donor-faq/#.YuIh4-xBy3J", typeForBadge: "Donate"),
    Coupon(name: "5% off wt+ voucher when you drop off garments", company: "Wing Tai Retail stores", imageString: "WING-TAI-LOGO", forType: "all", link: "https://www.wtplus.com.sg/repurpose-fashion-faqs/", typeForBadge: "Recycling"),
    Coupon(name: "Trade-in values range from $10 to $100, payable as store credit.", company: "Patagonia", imageString: "PATAGONIA-LOGO", forType: "brand", link: "https://help.patagonia.com/s/article/How-can-I-recycle-a-Patagonia-or-Worn-Wear-item", typeForBadge: "Recycling"),
    Coupon(name: "$5 reward credit for each clothing piece shipped", company: "Eileen Fisher", imageString: "EILEEN-FISHER-LOGO", forType: "brand", link: "https://www.eileenfisherrenew.com/learn-more", typeForBadge: "Recycling"),
    Coupon(name: "20% off single product voucher", company: "Levi’s", imageString: "LEVI-LOGO", forType: "certainItem", clothingType: ["jean"], link: "https://bluejeansgogreen.org/", typeForBadge: "Recycling"),
    Coupon(name: "Rent out or sell bags and earn up to 80-88% of your selling price.", company: "Second Edit", imageString: "SECOND-EDIT-LOGO", forType: "certainItem", clothingType: ["bag"], link: "https://www.styletheory.co/sg/bags/consignment", typeForBadge: "Recycling"),
    Coupon(name: "Accept most items, either new or gently used in any size. ", company: "Uplift Project", imageString: "NOT-LOADING", forType: "certainItem", clothingType: ["bra", "nursing pad"], link: "https://upliftbrasinsingapore.wordpress.com/how-to-donate/", typeForBadge: "Donate")
]

var forAllItems: [Coupon] = allCoupon.filter( {$0.forType == "all"} )
var forCertainBrands: [Coupon] = allCoupon.filter( {$0.forType == "brand"} )
var forCertainItems: [Coupon] = allCoupon.filter({ $0.forType == "certainItem"})
