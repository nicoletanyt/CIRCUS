//
//  ViewModel.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 1/9/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: PickerImage.Source = .library
    
    func showPhotoPicker() {
        if source == .camera {
            if !PickerImage.checkPermission() {
                print("There is no camera available on this device")
                return
            }
        }
        showPicker = true 
    }
}
