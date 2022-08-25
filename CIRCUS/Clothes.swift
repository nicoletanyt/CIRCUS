//
//  Clothes.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import Foundation
import SwiftUI

struct Clothes: Identifiable {
    var id = UUID()
    
    var name: String
    var size: String
    var image: Image?
    var brand: String
}
