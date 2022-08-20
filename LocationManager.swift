//
//  LocationManager.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 20/8/22.
//

import Foundation
import SwiftUI

class LocationManager: ObservableObject {
    @Published var locations: [Location] = [] {
        didSet {
            save()
        }
    }
    
    let sampleLocations: [Location] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "location.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedLocations = try? propertyListEncoder.encode(locations)
        try? encodedLocations?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalLocations: [Location]!
        
        if let retrievedLocationData = try? Data(contentsOf: archiveURL),
            let decodedLocations = try? propertyListDecoder.decode([Location].self, from: retrievedLocationData) {
            finalLocations = decodedLocations
        } else {
            finalLocations = sampleLocations
        }
        
        locations = finalLocations
    }
}
