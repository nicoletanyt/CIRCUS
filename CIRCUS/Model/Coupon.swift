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
    var type: String //type of discount (money, donate etc.) 
    var imageString: String
    var forType: String //whether this coupon is for all companies, certain brands, or certain clothing pieces
    var clothingType: [String] = []
    var link: String
}

//Data
var typesOfDiscount = ["Discount", "Credits for their store", "Money", "Donate"]
var allCoupon = [
    Coupon(name: "$10 discount next purchase (minimum $80)", company: "H&M", type: "Discount", imageString: "H&M-LOGO", forType: "all", link: "https://www2.hm.com/en_gb/sustainability-at-hm/our-work/close-the-loop.html"),
    Coupon(name: "S$0.20/kg of old clothing", company: "Veolia", type: "Money", imageString: "VEOLIA-LOGO", forType: "all", link: "https://data.gov.sg/dataset/cash-for-trash"),
    Coupon(name: "Bring items still in great condition in exchange for points", company: "Fashion Pulpit", type: "Credits for their store", imageString: "THE-FASHION-PULPIT-LOGO", forType: "all", link: "https://www.thefashionpulpit.com/"),
    Coupon(company: "Green square", type: "Donate", imageString: "GREENSQUARE-LOGO", forType: "all", link: "https://www.greensquare.com.sg/dropoff"),
    Coupon(company: "The Salvation Army", type: "Donate", imageString: "THE-SALVATION-ARMY-LOGO", forType: "all", link: "https://redshieldindustries.com/donor-faq/#.YuIh4-xBy3J"),
    Coupon(name: "5% off wt+ voucher when you drop off garments", company: "Wing Tai Retail stores", type: "Credits for their store", imageString: "WING-TAI-LOGO", forType: "all", link: "https://www.wtplus.com.sg/repurpose-fashion-faqs/"),
    Coupon(name: "Trade-in values range from $10 to $100, payable as store credit.", company: "Patagonia", type: "Credits for their store", imageString: "PATAGONIA-LOGO", forType: "brand", link: "https://help.patagonia.com/s/article/How-can-I-recycle-a-Patagonia-or-Worn-Wear-item"),
    Coupon(name: "$5 reward credit for each clothing piece shipped", company: "Eileen Fisher", type: "Credits for their store", imageString: "EILEEN-FISHER-LOGO", forType: "brand", link: "https://www.eileenfisherrenew.com/learn-more"),
    Coupon(name: "20% off single product voucher", company: "Levi’s", type: "Voucher", imageString: "LEVI-LOGO", forType: "certainItem", clothingType: ["jean"], link: "https://bluejeansgogreen.org/"),
    Coupon(name: "Rent out or sell bags and earn up to 80-88% of your selling price.", company: "Second Edit", type: "Money", imageString: "SECOND-EDIT-LOGO", forType: "certainItem", clothingType: ["bag"], link: "https://www.styletheory.co/sg/bags/consignment"),
    Coupon(name: "Accept most items, either new or gently used in any size. ", company: "Uplift Project", type: "Donate", imageString: "NOT-LOADING", forType: "certainItem", clothingType: ["bra", "nursing pad"], link: "https://upliftbrasinsingapore.wordpress.com/how-to-donate/")
]

var forAllItems: [Coupon] = allCoupon.filter( {$0.forType == "all"} )
var forCertainBrands: [Coupon] = allCoupon.filter( {$0.forType == "brand"} )
var forCertainItems: [Coupon] = allCoupon.filter({ $0.forType == "certainItem"})

var discountCoupons: [Coupon] = allCoupon.filter( {$0.type == "Discount"} )
var creditCoupons: [Coupon] = allCoupon.filter( {$0.type == "Credits for their store"} )
var moneyCoupons: [Coupon] = allCoupon.filter( {$0.type == "Money"} )
var donateCoupons: [Coupon] = allCoupon.filter( {$0.type == "Donate"} )
