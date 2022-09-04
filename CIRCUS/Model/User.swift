//
//  User.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 4/9/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var locations: [String]
    var levels: [Int] //0 is for Recycling, 1 is for Donating.
    var currentAvatar: String
    var currentLocation: String
}
