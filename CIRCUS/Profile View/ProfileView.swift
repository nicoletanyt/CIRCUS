//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var location = ""
    @State var currentAvatar = "BADGE1"
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Image(currentAvatar) //current avatar
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFit()
                        .mask(RoundedRectangle(cornerRadius: 30))
                    NavigationLink (destination: EditImageView(currentAvatar: currentAvatar)){
                        Text("Edit")
                            .foregroundColor(Color.blue)
                            .padding(30)
                    }
                }
                
                Section {
                    VStack {
                        Text("Enter a convenient place for you to make clothes exchanges with others.")
                            .padding()
                        Spacer()
                        HStack {
                            Image(systemName: "location.circle.fill")
                                .foregroundColor(Color.gray)
                            TextField("Location", text: $location)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                Section {
                    //CouponView()
                }
            }
            .navigationTitle("Your Profile")
        }
    }
}


//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//
//}
