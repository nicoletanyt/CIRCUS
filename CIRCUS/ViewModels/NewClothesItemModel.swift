//
//  NewClothesItemModel.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 2/9/22.
//

import Foundation

class ClothesItemModel: ObservableObject {
    @Published var name = ""
    @Published var brand = ""
    @Published var size = "M"
    @Published var imageString = "" 
    var id: String?
    
    var isDisabled: Bool {
        name.isEmpty //if it is empty, cannot create the item
    }
    
    init() {}
    
    init(_ currentClothe: Clothes) {
        self.name = currentClothe.name
        self.brand = currentClothe.brand
        self.size = currentClothe.size
        self.imageString = currentClothe.imageString ?? "NOT LOADING"
        
        id = currentClothe.id
        
    }
}
