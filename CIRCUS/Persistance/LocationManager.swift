//
//  LocationManager.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 20/8/22.
//

import Foundation
import SwiftUI

class LocationManager: ObservableObject {
    @Published var locations: [String] = [] {
        didSet {
            save()
        }
    }
    
    let sampleLocations: [String] = []
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "location.plist"
        let documentsDirectory =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
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
        
        var finalLocations: [String]!
        
        if let retrievedLocationData = try? Data(contentsOf: archiveURL),
            let decodedLocations = try? propertyListDecoder.decode([String].self, from: retrievedLocationData) {
            finalLocations = decodedLocations
        } else {
            finalLocations = sampleLocations
        }
        
        locations = finalLocations
    }
}

class CurrentLocationManager: ObservableObject {
    @Published var currentLocations: [String] = [] { //@Published: page would be reloaded when this variable is changed
        didSet {
            save()
        }
    }

    let sampleCurrentLocations: [String] = []

    init() {
        load()
    }

    func getArchiveURL() -> URL {
        let plistName = "currentLocations.plist"
        let documentsDirectory =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        return documentsDirectory.appendingPathComponent(plistName)
    }

    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedCurrentLocations = try? propertyListEncoder.encode(currentLocations)
        try? encodedCurrentLocations?.write(to: archiveURL, options: .noFileProtection)
    }

    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()

        var finalCurrentLocations: [String]!

        if let retrievedCurrentLocationData = try? Data(contentsOf: archiveURL),
            let decodedCurrentLocations = try? propertyListDecoder.decode([String].self, from: retrievedCurrentLocationData) {
            finalCurrentLocations = decodedCurrentLocations
        } else {
            finalCurrentLocations = sampleCurrentLocations
        }

        currentLocations = finalCurrentLocations
    }
}
