//
//  ClothesManager.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 31/8/22.
//

import Foundation

class ClothesManager: ObservableObject {
    @Published var clothes: [Clothes] = []
    @Published var filteredText = "" {
        didSet {
            if !filteredText.isEmpty {
                filteredClothes = clothes.filter {$0.name.localizedStandardContains(filteredText)}
            } else {
                filteredClothes = clothes
            }
        }
    }
    @Published var filteredClothes: [Clothes] = []
    
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName){
            loadClothes()
        }
    }
    
    func addClothes(_ clothe: Clothes) {
        clothes.append(clothe)
        saveClothes()
    }
    
    func updateClothes(_ clothe: Clothes) {
        guard let index = clothes.firstIndex(where: { $0.id == clothe.id}) else { return }
        clothes[index] = clothe
        saveClothes()
    }
    
    func deleteClothes(at indexSet: IndexSet) {
        clothes.remove(atOffsets: indexSet)
        saveClothes()
    }
    
    func loadClothes() {
        print("loading clothes")
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    clothes = try decoder.decode([Clothes].self, from: data)
                    filteredClothes = clothes 
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveClothes() {
        print("Saving clothes to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(clothes)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}



//import Foundation
//import SwiftUI
//
//class ClothesManager: ObservableObject {
//    @Published var clothess: [Clothes] = [] {
//        didSet {
//            save()
//        }
//    }
//
//    let sampleClothess: [Clothes] = []
//
//    init() {
//        load()
//    }
//
//    @Published var filteredData = [Clothes]()
//
//    func search(with query: String = "") {
//        filteredData = query.isEmpty ? clothess : clothess.filter { $0.name.contains(query)}
//    }
//
//    func getArchiveURL() -> URL {
//        let plistName = "clothess.plist"
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//
//        return documentsDirectory.appendingPathComponent(plistName)
//    }
//
//    func save() {
//        let archiveURL = getArchiveURL()
//        let propertyListEncoder = PropertyListEncoder()
//        let encodedClothess = try? propertyListEncoder.encode(clothess)
//        try? encodedClothess?.write(to: archiveURL, options: .noFileProtection)
//    }
//
//    func load() {
//        let archiveURL = getArchiveURL()
//        let propertyListDecoder = PropertyListDecoder()
//
//        var finalClothess: [Clothes]!
//
//        if let retrievedClothesData = try? Data(contentsOf: archiveURL),
//            let decodedClothess = try? propertyListDecoder.decode([Clothes].self, from: retrievedClothesData) {
//            finalClothess = decodedClothess
//        } else {
//            finalClothess = sampleClothess
//        }
//
//        clothess = finalClothess
//    }
//}
