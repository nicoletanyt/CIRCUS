//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var currentAvatar = "BADGE1"
    @State var currentLocation = "NIL"
    
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
                    NavigationLink (destination: EnterLocationView(currentLocation: $currentLocation)) {
                        Text(currentLocation)
                    }
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


//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//
//}
