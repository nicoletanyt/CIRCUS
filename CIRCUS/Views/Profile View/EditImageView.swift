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
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var uservm: UserDataStore
    
    var allAvatars: [Avatar] = [
        Avatar(imageStr: "SHRUB-0", level: 0, type: "Recycle"),
        Avatar(imageStr: "SHRUB-1", level: 1, type: "Recycle"),
        Avatar(imageStr: "SHRUB-2", level: 2, type: "Recycle"),
        Avatar(imageStr: "FLOWERPOT-0", level: 0, type: "Donate"),
        Avatar(imageStr: "FLOWERPOT-1", level: 1, type: "Donate"),
        Avatar(imageStr: "FLOWERPOT-2", level: 2, type: "Donate")
    ]
    var levelRecycled: Int {
        uservm.user.itemsRecycled / 5
    }
    var levelDonated: Int {
        uservm.user.itemsDonated / 5
    }
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var filteredAvatars: [Avatar] {
        allAvatars.filter( {$0.type == "Recycle" ? $0.level <= levelRecycled :  $0.level <= levelDonated} )
    }
    @State var showAlert = false
    @State var itemsMoreToUnlock = 0
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Text("Current Avatar: ")
                        .font(.title)
                    Spacer()
                    Image(uservm.user.currentAvatar)
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
            .onAppear(perform: uservm.loadUserInformation)

        }
        .background(Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
            .resizable())
    }
}

//struct EditImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditImageView()
//    }
//}

extension EditImageView {
    var displayAvatars: some View {
        LazyVGrid (columns: columns, spacing: 10){
            ForEach(allAvatars) { avatar in
                Button {
                    if filteredAvatars.contains(where: {$0.imageStr == avatar.imageStr}) {
                        uservm.user.currentAvatar = avatar.imageStr
                        uservm.saveUserInformation()
                    } else {
                        showAlert = true
                        itemsMoreToUnlock = (avatar.level - (avatar.type == "Recycle" ? levelRecycled : levelDonated)) * 5
                        print(itemsMoreToUnlock)
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
                .background(Color.white)
                .cornerRadius(20)
                .alert("Donate more items to unlock!", isPresented: $showAlert) {
                    Button {
                        showAlert = false
                    } label: {
                        Text("OK")
                    }
                } message: {
                    Text("You need to recycle another \(itemsMoreToUnlock) more items to be able to unlock this badge.")
                }
            }
            .padding()
        }
        .background(Color("LIGHT-BROWN"))
        .cornerRadius(20)
        .onAppear(perform: uservm.loadUserInformation)
    }
}
