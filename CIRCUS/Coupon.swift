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
}

//Data
var typesOfDiscount = ["Discount", "Credits for their store", "Money", "Donate"]
var allCoupon = [
    Coupon(name: "$10 discount next purchase (minimum $80)", company: "H&M", type: "Discount", imageString: "H&M-LOGO", forType: "all"),
    Coupon(name: "S$0.20/kg of old clothing", company: "Veolia", type: "Money", imageString: "VEOLIA-LOGO", forType: "all"),
    Coupon(name: "Bring items still in great condition in exchange for points", company: "Fashion Pulpit", type: "Credits for their store", imageString: "THE-FASHION-PULPIT-LOGO", forType: "all"),
    Coupon(company: "Green square", type: "Donate", imageString: "GREENSQUARE-LOGO", forType: "all"),
    Coupon(company: "The Salvation Army", type: "Donate", imageString: "THE-SALVATION-ARMY-LOGO", forType: "all"),
    Coupon(name: "5% off wt+ voucher when you drop off garments", company: "Wing Tai Retail stores", type: "Credits for their store", imageString: "WING-TAI-LOGO", forType: "all"),
    Coupon(name: "Trade-in values range from $10 to $100, payable as store credit.", company: "Patagonia", type: "Credits for their store", imageString: "PATAGONIA-LOGO", forType: "brand"),
    Coupon(name: "$5 reward credit for each clothing piece shipped", company: "Eileen Fisher", type: "Credits for their store", imageString: "EILEEN-FISHER-LOGO", forType: "brand"),
    Coupon(name: "20% off single product voucher", company: "Levi’s", type: "Voucher", imageString: "LEVI-LOGO", forType: "certainItem", clothingType: ["jean"]),
    Coupon(name: "Rent out or sell bags and earn up to 80-88% of your selling price.", company: "Second Edit", type: "Money", imageString: "SECOND-EDIT-LOGO", forType: "certainItem", clothingType: ["bag"]),
    Coupon(name: "Accept most items, either new or gently used in any size. ", company: "Uplift Project", type: "Donate", imageString: "NOT-LOADING", forType: "certainItem", clothingType: ["bra", "nursing pad"])
]

var forAllItems: [Coupon] = allCoupon.filter( {$0.forType == "all"} )
var forCertainBrands: [Coupon] = allCoupon.filter( {$0.forType == "brand"} )
var forCertainItems: [Coupon] = allCoupon.filter({ $0.forType == "certainItem"})

var discountCoupons: [Coupon] = allCoupon.filter( {$0.type == "Discount"} )
var creditCoupons: [Coupon] = allCoupon.filter( {$0.type == "Credits for their store"} )
var moneyCoupons: [Coupon] = allCoupon.filter( {$0.type == "Money"} )
var donateCoupons: [Coupon] = allCoupon.filter( {$0.type == "Donate"} )
