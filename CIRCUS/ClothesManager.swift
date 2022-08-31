//
//  ClothesManager.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 31/8/22.
//

import Foundation
import SwiftUI

class ClothesManager: ObservableObject {
    @Published var clothess: [Clothes] = [] {
        didSet {
            save()
        }
    }
    
    let sampleClothess: [Clothes] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "clothess.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedClothess = try? propertyListEncoder.encode(clothess)
        try? encodedClothess?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalClothess: [Clothes]!
        
        if let retrievedClothesData = try? Data(contentsOf: archiveURL),
            let decodedClothess = try? propertyListDecoder.decode([Clothes].self, from: retrievedClothesData) {
            finalClothess = decodedClothess
        } else {
            finalClothess = sampleClothess
        }
        
        clothess = finalClothess
    }
}
