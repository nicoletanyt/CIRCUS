//
//  RecentlyWornView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 14/9/22.
//

import SwiftUI

struct RecentlyWornView: View {
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var clothesWornManager: ClothesWornDataStore
    @EnvironmentObject var imagevm: ImageViewModel
    @State var isSheetShown: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack {
                List() {
                    ForEach(organisedClothes) { item in
                        RecentClothingItemView(item: item)
                    }
                }
                .navigationTitle("Recently Worn")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isSheetShown = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .background(
                Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
                    .resizable())
        }
        .sheet(isPresented: $isSheetShown) {
            AddNewRecentView()
        }
    }
    var organisedClothes: [Clothes] {
        clothesWornManager.clothesWorn.sorted(by: {$0.recentlyWorn > $1.recentlyWorn})
    }
}

struct RecentClothingItemView: View {
    @EnvironmentObject var clothesvm: ClothesItemModel
    @EnvironmentObject var imagevm: ImageViewModel
    var item: Clothes
    
    var indexOfImage: Int? {
        imagevm.clothesImages.firstIndex(where: {item.name == $0.name})
    }
    
    var body: some View {
        HStack {
            if let keyOfImageIndex =  imagevm.clothesImages.firstIndex(where: {item.name == $0.name}) {
                Image(uiImage: imagevm.clothesImages[keyOfImageIndex].image)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .leading)
                    .clipShape(Circle())
                    .scaledToFit()
            } else {
                //if image doesn't exist
                Image("NOT-LOADING")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .leading)
                    .clipShape(Circle())
                    .scaledToFit()
            }
            VStack {
                Text("Type: " + item.name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(getCurrentTime(clothing: item))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .frame(height: 100)
        .onAppear {
            imagevm.loadclothesImagesJSONFile()
        }
    }
    
    func getCurrentTime(clothing: Clothes) -> String {
        let date = item.recentlyWorn
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let dateDisplayed = "Date Worn: \(day)/\(month)/\(year)"
        return dateDisplayed
    }
}

struct RecentlyWornView_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyWornView()
    }
}

