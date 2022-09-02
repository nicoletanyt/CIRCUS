//
//  EditImageView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

struct EditImageView: View {
    
    let profileAvatars = [Avatar(imageStr: "BADGE1", level: 1) , Avatar(imageStr: "BADGE2", level: 2), Avatar(imageStr: "BADGE1", level: 3)]
    @State var currentAvatar = ""
    let columns = [GridItem(.adaptive(minimum: 170))]
    @State var level = 3 //level for badges
    
    var filteredAvatars: [Avatar] {
        return profileAvatars.filter{ $0.level > level}
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Current Avatar: ")
                    .background(Color.brown.opacity(0.3))
                Image(currentAvatar)
                    .resizable()
                    .frame(width: 100, height: 100)
                ScrollView {
                    LazyVGrid (columns: columns, spacing: 10){
                        ForEach(profileAvatars) { avatar in
                            VStack {
                                Button {
                                    currentAvatar = avatar.imageStr
                                } label: {
                                    Image(avatar.level <= level ? avatar.imageStr : "LOCKED")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(width: 400, height: 380, alignment: .center)
                .border(Color.black)
            }
        } .navigationTitle("Edit Profile")
    }
}

//struct EditImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditImageView()
//    }
//}
