//
//  Clothes.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import Foundation
import SwiftUI

struct Clothes: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var name: String
    var size: String
    var brand: String
}
