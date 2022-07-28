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
    
    var layout = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    
    var body: some View {
        ZStack{
            VStack (spacing: 20){
                Text("MY CLOSET")
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding(10)
                searchBarView()
                Spacer()
                ScrollView {
                    LazyVGrid (columns: layout, spacing: 20){
                        ForEach (clothes) { clothe in
                            VStack{
                                clothesItemView(sizeText: clothe.size, nameText: clothe.name)
                            }
                        }
                    }
                }
            }
        }
        .background(
            Image("APP-BACKGROUND")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
            
        }
}

struct ClosetView_Previews: PreviewProvider {
    static var previews: some View {
        ClosetView()
    }
}

struct clothesItemView: View {
    //Rectangle View for each clothes item
    
    var sizeText: String
    var nameText: String
    
    var body: some View {
        VStack {
            Image("")
            Text(sizeText)
            Text(nameText)
        }
        .frame(width: 173, height: 239)
        .background(Color.lightBrown)
    }
}

struct searchBarView: View {
    var body: some View {
        Rectangle()
            .frame(width: 355, height: 50, alignment: .center)
            .foregroundColor(.navyGreen)
            .cornerRadius(20)
    }
}
