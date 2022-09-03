//
//  ClothesManager.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 3/9/22.
//

import Foundation
import UIKit

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    //For Clothes
    func saveDocument(contents: String, docName: String, completion: (Error?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    
    func readDocument(docName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
    
    //For Images
    func docExistImage(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
    
    func saveDocumentImage(contents: String) throws {
        let url = Self.docDirURL.appendingPathComponent("MyImages.json")
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            throw ImagesError.saveError
        }
    }
    
    func readDocumentImage() throws -> Data {
        let url = Self.docDirURL.appendingPathComponent("MyImages.json")
        do {
            return try Data(contentsOf: url)
        } catch {
            throw ImagesError.readError
        }
    }
    
    func saveImage(_ id: String, image: UIImage) throws {
        if let data = image.jpegData(compressionQuality: 0.6) {
            let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
            do {
                try data.write(to: imageURL)
            } catch {
                throw ImagesError.saveImageError
            }
        } else {
            throw ImagesError.saveImageError
        }
    }
    
    func readImage(with id: UUID) throws -> UIImage {
        let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
        do {
            let imageData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: imageData) {
                return image
            } else {
                throw ImagesError.readImageError
            }
        } catch {
            throw ImagesError.readImageError
        }
    }
}
