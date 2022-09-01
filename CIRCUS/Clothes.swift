//
//  Clothes.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import Foundation
import SwiftUI

//@propertyWrapper
struct Clothes: Identifiable, Codable {
    var id = UUID()
    
    var name: String
    var size: String
//    var image: Image
    var imageString: String?
    var brand: String
}
