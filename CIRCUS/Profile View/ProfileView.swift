//
//  ProfileView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var location = ""
    
    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    Image("SHIRT")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFit()
                        .mask(RoundedRectangle(cornerRadius: 30))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Section {
                    VStack {
                        Text("Enter a convenient place for you to make clothes exchanges with others.")
                            .frame(maxWidth: .infinity, alignment: .leading)
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
