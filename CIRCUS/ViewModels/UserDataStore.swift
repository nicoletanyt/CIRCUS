//
//  UserDataStore.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 4/9/22.
//

import Foundation

class UserDataStore: ObservableObject {
    @Published var user: User = User(locations: ["NIL"], levels: [1, 2], currentAvatar: "FLOWERPOT-0", currentLocation: "NIL")
    
    let fileName =  "User.json"
    
    init() {
        if FileManager().docExist(named: fileName){
            loadUserInformation()
        }
    }
    
    func loadUserInformation() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    user = try decoder.decode(User.self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveUserInformation() {
        print("Saving user to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(user)
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
