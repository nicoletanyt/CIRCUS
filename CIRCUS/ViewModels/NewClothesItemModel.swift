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
    @Published var recentlyWorn = Date()
    var id: String?
    
    init() {}
    
    init(_ currentClothe: Clothes) {
        self.name = currentClothe.name
        self.brand = currentClothe.brand
        self.size = currentClothe.size
        
        id = currentClothe.id
        
    }
}
