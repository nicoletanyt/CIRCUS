//
//  EditImageView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 16/8/22.
//

import SwiftUI

struct EditImageView: View {
    //Design
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    @Environment(\.colorScheme) var colorScheme
    
    let avatarRecycle = [
        Avatar(imageStr: "SHRUB-0", level: 0),
        Avatar(imageStr: "SHRUB-1", level: 1),
        Avatar(imageStr: "SHRUB-2", level: 2)
    ]
    let avatarDonate = [
        Avatar(imageStr: "FLOWERPOT-0", level: 0),
        Avatar(imageStr: "FLOWERPOT-1", level: 1),
        Avatar(imageStr: "FLOWERPOT-2", level: 2)
    ]
    var allAvatars: [Avatar] {
        return avatarRecycle + avatarDonate
    }
    
    @State var currentAvatar = ""
    let columns = [GridItem(.adaptive(minimum: 100))]
    @State var levels = [1, 3] //Recycling, Donating. Supposed to be stored for data persisetence
    
    var filteredAvatars: [Avatar] {
        return avatarRecycle.filter{ $0.level < levels[0]} + avatarDonate.filter{ $0.level < levels[1]}
    }
    
    var body: some View {
        ZStack {
            Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                .resizable()
            VStack{
                HStack {
                    Text("Current Avatar: ")
                        .font(.title)
                    Spacer()
                    Image(currentAvatar)
                        .resizable()
                        .padding()
                        .frame(width: 125, height: 200)
                        .background(Color("MACHA-GREEN"))
                        .cornerRadius(20)
                }
                .padding()
                displayAvatars
//                .frame(width: 400, height: 450, alignment: .center)
            }
            .padding()
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.top)
//        .background(
//
//        )
    }
}

struct EditImageView_Previews: PreviewProvider {
    static var previews: some View {
        EditImageView()
    }
}

extension EditImageView {
    var displayAvatars: some View {
        LazyVGrid (columns: columns, spacing: 10){
            ForEach(allAvatars) { avatar in
                Button {
                    if filteredAvatars.contains(where: {$0.imageStr == avatar.imageStr}) {
                        currentAvatar = avatar.imageStr
                    } else {
                        return
                    }
                } label: {
                    if filteredAvatars.contains(where: {$0.imageStr == avatar.imageStr}) {
                        Image(avatar.imageStr)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 62.5, height: 100)
                            .padding()
                    } else {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 62.5, height: 100)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                }
//                .background(Color("LIGHT-BROWN"))
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding()
        }
        .background(Color("LIGHT-BROWN"))
        .cornerRadius(20)
    }
}
