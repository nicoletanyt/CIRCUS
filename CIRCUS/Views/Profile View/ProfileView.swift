//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var currentAvatar = "BADGE1" //To be done for persistence
    @ObservedObject var currentLocationManager = CurrentLocationManager()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: EditImageView()) {
                        HStack {
                            Image(currentAvatar) //current avatar: Persistence 
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                            Spacer()
                            Text("Edit")
                                .foregroundColor(Color.blue)
                        }
                    }
                } header: {
                    Text("YOUR AVATARS")
                }
                Section  {
                    NavigationLink (destination: EnterLocationView()) {
                        Text(currentLocationManager.currentLocations.last == nil ? "NIL" : currentLocationManager.currentLocations.last!)
                    }
                    Text("PLEASE QUIT THE APP TO RELOAD.")
                        .foregroundColor(Color.red)
                } header: {
                    Text("LOCATION")
                }
                Section {
                    //CouponView()
                }
            }
            .navigationTitle("Profile Page")
        }
    }
}
