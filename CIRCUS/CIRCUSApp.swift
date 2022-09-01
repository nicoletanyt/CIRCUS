//
//  CIRCUSApp.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

@main
struct CIRCUSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable ")
                }
        }
    }
}
