//
//  ClosetView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI
//
//extension Color {
//    static let lightBrown = Color(red: 208/255, green: 174/255, blue: 130/255)
//    static let navyGreen = Color(red: 177/255, green: 167/255, blue: 82/255)
//}

struct ClosetView: View {
    
    @StateObject var clothesManager = ClothesManager()
    
    @State var isDetailSheetPresented = false
    
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    @Environment(\.colorScheme) var colorScheme
    
    //Search Bar variables
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach($clothesManager.filteredData) { $item in
                        NavigationLink {
                            DetailedClothesItemView(clothes: $item)
                        } label: {
                            clothesItemView(sizeText: item.size, nameText: item.name, image: item.imageString == "" ? Image("NOT-LOADING"): Image(item.imageString), brandText: item.brand)
                        }
                    }
                    .onDelete { indexSet in
                        clothesManager.clothess.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        clothesManager.clothess.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
                .navigationTitle("My Closet")
                .searchable(text: $searchText )
                .onChange(of: searchText, perform: { newQuery in
                    clothesManager.search(with: newQuery)
                })
                .onAppear {
                    clothesManager.search()
                }
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
                .sheet(isPresented: $isDetailSheetPresented) {
                    NewClotheItemView(clothes: $clothesManager.clothess)
                }
            }
            .background(
                Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                    .resizable())
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
    var image: Image?
    var brandText: String
    
    var body: some View {
        HStack {
            self.image?
                .resizable()
            //.aspectRatio(contentMode: .fit)
                .scaledToFit()
                .mask(Circle().frame(width: 80, height: 80, alignment: .leading))
            VStack {
                Text("Type: " + nameText)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Size: " + sizeText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                Text("Brand: " + brandText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
            }
            .padding()
        }
        .frame(height: 100)
    }
}
