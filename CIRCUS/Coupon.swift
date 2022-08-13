//
//  Coupon.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 12/8/22.
//

import Foundation

struct Coupon: Identifiable {
    var id = UUID()
    var name: String
    var company: String
    var type: String
}

//Name of Company: String of logo Image
var companyLogos: [String: String] = ["H&M": "H&M LOGO", "LEVI'S": "LEVI'S LOGO"]
