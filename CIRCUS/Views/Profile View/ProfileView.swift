//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var currentAvatar = "BADGE1" //To be done for persistence
    @EnvironmentObject var uservm: UserDataStore
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section {
                        NavigationLink(destination: EditImageView()) {
                            HStack {
                                Image(uservm.user.currentAvatar)
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
                            Text(uservm.user.currentLocation)
                        }
                    } header: {
                        Text("LOCATION")
                    }
                    Section {
                        Text("You have donated \(uservm.user.itemsDonated) items.")
                        Text("You have recycled \(uservm.user.itemsRecycled) items.")
                    } header: {
                        Text("CONTRIBUTIONS")
                    }
                }
                .navigationTitle("Profile Page")
                .onAppear(perform: uservm.loadUserInformation)
            }
            .background(
                Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                    .resizable())
        }
    }
}
