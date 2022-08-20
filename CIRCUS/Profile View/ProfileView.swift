//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var currentAvatar = "BADGE1"
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: EditImageView(currentAvatar: currentAvatar)) {
                        HStack {
                            Image(currentAvatar) //current avatar
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
                    DisplayLocation(locations: $locationManager.locations)
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

struct DisplayLocation: View {
    //@ObservedObject var currentLocationManager = CurrentLocationManager()
    @Binding var locations: [String]
    
    var body: some View {
        NavigationLink (destination: EnterLocationView()) {
            Text(locations.last!)
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//
//}
