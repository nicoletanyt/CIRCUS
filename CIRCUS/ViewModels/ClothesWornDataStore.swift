//
//  ClothesWornDataStore.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 14/9/22.
//

import Foundation

class ClothesWornDataStore: ObservableObject {
    @Published var clothesWorn: [Clothes] = []
    
    let fileName =  "ClothesWorn.json"
    
    init() {
//        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName){
            loadWornClothes()
        }
    }
    
    func addWornClothes(_ clothe: Clothes) {
        clothesWorn.append(clothe)
        saveWornClothes()
    }
    
    func updateWornClothes(_ clothe: Clothes) {
        guard let index = clothesWorn.firstIndex(where: { $0.id == clothe.id}) else { return }
        clothesWorn[index] = clothe
        saveWornClothes()
    }
    
    func deleteClothes(at indexSet: IndexSet) {
        clothesWorn.remove(atOffsets: indexSet)
        saveWornClothes()
    }
    
    func loadWornClothes() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    clothesWorn = try decoder.decode([Clothes].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveWornClothes() {
        print("Saving worn clothes to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(clothesWorn)
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
