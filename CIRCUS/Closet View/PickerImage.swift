//
//  Picker.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 1/9/22.
//

import Foundation
import UIKit

enum PickerImage {
    enum Source {
        case library, camera 
    }
    
    static func checkPermission() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false 
        }
    }
}
