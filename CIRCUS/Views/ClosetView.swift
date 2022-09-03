//
//  ClosetView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 28/7/22.
//

import SwiftUI

struct ClosetView: View {
    //Design
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var clothesManager: ClothesDataStore
    @State var isSheetShown: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List() {
                    ForEach(clothesManager.clothes) { item in
                        NavigationLink {
                            
                        } label: {
                            ClothingItemView(item: item)
                        }
                    }
                    .onDelete(perform: clothesManager.deleteClothes)
                }
                .navigationTitle("My Closet")
                .searchable(text: $clothesManager.filteredText, prompt: Text("Filter Clothing Item"))
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
            NewClothesItemView(clothesvm: ClothesItemModel())
        }
    }
}

//struct ClosetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClosetView()
//    }
//}

struct ClothingItemView: View {
    @ObservedObject var clothesvm = ClothesItemModel()
    @ObservedObject var vm = ImageViewModel()
    var item: Clothes
    
    var body: some View {
        HStack {
            Image(uiImage: vm.image ?? UIImage(imageLiteralResourceName: "NOT-LOADING"))
                .resizable()
                .scaledToFit()
                .mask(Circle().frame(width: 80, height: 80, alignment: .leading))
            VStack {
                Text("Type: " + item.name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Size: " + item.size)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                Text("Brand: " + item.brand)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
            }
            .padding()
        }
        .frame(height: 100)
    }
}
