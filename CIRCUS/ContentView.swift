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
            RecyclingView()
                .tabItem {
                    Image(systemName: "arrow.3.trianglepath")
                    Text("Recycling")
                }
            ExchangeView()
                .tabItem {
                    Image(systemName: "arrow.right.square.fill")
                    Text("Donate")
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
