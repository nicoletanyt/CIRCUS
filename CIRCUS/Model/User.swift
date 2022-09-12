//
//  User.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 4/9/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
//    var locations: [String]
    var itemsRecycled: Int
    var itemsDonated: Int
    var currentAvatar: String
    var currentLocation: String
}
