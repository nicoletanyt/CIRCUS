//
//  ClosetView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

extension Color {
    static let lightBrown = Color(red: 208/255, green: 174/255, blue: 130/255)
    static let navyGreen = Color(red: 177/255, green: 167/255, blue: 82/255)
}

struct ClosetView: View {
    
    @State var clothes = [Clothes(name: "PANTS", size: "L"), Clothes(name: "SHIRT", size: "XL"), Clothes(name: "DRESS", size: "L")]
    
    @State var isDetailSheetPresented = false
    
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    
    //Search Bar variables
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(filteredClothes) { item in
                        clothesItemView(sizeText: item.size, nameText: item.name)
                    }
                    .onDelete { indexSet in
                        clothes.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("My Closet")
                .searchable(text: $searchText )
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isDetailSheetPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .background(
                Image("APP-BACKGROUND")
                    .resizable())
        }
    }
    var filteredClothes: [Clothes] {
        if searchText.isEmpty {
            return clothes
        } else {
            return clothes.filter { $0.name.localizedStandardContains(searchText)}
        }
    }
}

//struct ClosetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClosetView()
//    }
//}

struct clothesItemView: View {
    //Rectangle View for each clothes item
    
    var sizeText: String
    var nameText: String
    
    var body: some View {
        HStack {
            Image ("")
            VStack {
                Text(sizeText)
                Text(nameText)
            }
        }
        .frame(height: 100)
    }
}
