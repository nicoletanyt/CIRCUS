//
//  ViewModel.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 1/9/22.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: PickerImage.Source = .library
    
    @Published var clothesImages: [ClothesImage] = []
    @Published var showFileAlert = false
    @Published var appError: ImagesError.ErrorType?
    
    let fileName =  "ClothesImages.json"
    
    init() {
//        print(FileManager.docDirURL.path)
    }
    
    func showPhotoPicker() {
        if source == .camera {
            if !PickerImage.checkPermission() {
                print("There is no camera available on this device")
                return
            }
        }
        showPicker = true 
    }
    
    func reset() {
        image = nil //selected image in the image picker.
    }
    
    func deleteImage(at indexSet: IndexSet) {
        clothesImages.remove(atOffsets: indexSet)
        saveclothesImagesJSONFile()
        reset()
    }
    
    func addMyImage(_ name: String, image: UIImage) {
        reset()
        let myImage = ClothesImage(name: name)
        do {
            try FileManager().saveImage("\(myImage.id)", image: image)
            clothesImages.append(myImage)
            print(clothesImages)
            saveclothesImagesJSONFile()
            reset()
        } catch {
            showFileAlert = true
            appError = ImagesError.ErrorType(error: error as! ImagesError)
        }
    }
    
    func saveclothesImagesJSONFile() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(clothesImages)
            let jsonString = String(decoding: data, as: UTF8.self)
            reset()
            do {
                try FileManager().saveDocumentImage(contents: jsonString)
            } catch {
                showFileAlert = true
                appError = ImagesError.ErrorType(error: error as! ImagesError)
            }
        } catch {
            showFileAlert = true
            appError = ImagesError.ErrorType(error: .encodingError)
        }
    }
    
    func loadclothesImagesJSONFile() {
        do {
            let data = try FileManager().readDocumentImage()
            let decoder = JSONDecoder()
            do {
                clothesImages = try decoder.decode([ClothesImage].self, from: data)
            } catch {
                showFileAlert = true
                appError = ImagesError.ErrorType(error: .decodingError)
            }
        } catch {
            showFileAlert = true
            appError = ImagesError.ErrorType(error: error as! ImagesError)
        }
    }
}
