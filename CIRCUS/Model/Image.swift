//
//  Image.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 3/9/22.
//

import Foundation
import UIKit
import SwiftUI

struct ClothesImage: Identifiable, Codable, Hashable {
    var id = UUID() //this is for data persistence json
    var name: String //name of clothes for this image
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
