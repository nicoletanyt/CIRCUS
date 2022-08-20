//
//  EnterLocationView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 19/8/22.
//

import SwiftUI

struct EnterLocationView: View {
    @Binding var currentLocation: String
    @State var isShowSheet: Bool = false
    @State var isCancel: Bool = false
    @State var pastLocations: [Location] = [Location(location: "NIL")]
    
    
    var body: some View {
        Form {
            Section {
                Text("Enter a convenient place for you to make clothes exchanges with others.")
                    .font(.system(size: 20, weight: .regular, design: .serif))
            }
            Section {
                Button {
                    isShowSheet = true
                } label: {
                    Text(currentLocation)
                        .foregroundColor(Color.black)
                }
            } header: {
                Text("CURRENTLY SET TO")
            }
            Section {
                List {
                    ForEach(pastLocations, id: \.self) { location in
                        Text(location.location)
                    }
                }
            } header: {
                Text("PAST LOCATIONS SET")
            }
            Spacer()
        }
        .sheet(isPresented: $isShowSheet) {
            LocationTextField(location: $currentLocation, pastLocations: $pastLocations)
        }
        //            HStack {
        //                Image(systemName: "location.circle.fill")
        //                    .foregroundColor(Color.gray)
        //                TextField("Location", text: $location)
        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
        //            }
    }
}

struct LocationTextField: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var location: String
    @Binding var pastLocations: [Location]
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Text("Location")
                        .bold()
                    Spacer(minLength: 100)
                    Button {
                        pastLocations.append(Location(location: location))
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor(Color.blue)
                            .bold()
                    }
                    .padding()
                }
                .frame(height: 80)
            }
            .background(Color.gray .opacity(0.3))
            TextField("Enter Your Location", text: $location)
                .padding()
            Spacer()
        }
    }
}

//struct EnterLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterLocationView()
//    }
//}
