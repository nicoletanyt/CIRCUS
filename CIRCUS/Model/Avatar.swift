//
//  Avatar.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 17/8/22.
//

import Foundation

struct Avatar: Identifiable {
    var id = UUID()
    var imageStr: String
    var locked: Bool?
    var level: Int //level to attain this badge
}
