//
//  ContentView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ClosetView()
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Closet")
                }
            BenefitsView()
                .tabItem {
                    Image(systemName: "arrow.3.trianglepath")
                    Text("Benefits")
                }
            RecentlyWornView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("Recently Worn")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
