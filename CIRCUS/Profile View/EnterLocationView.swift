//
//  EnterLocationView.swift
//  CIRCUS
//
//  Created by NICOLE TAN YITONG stu on 19/8/22.
//

import SwiftUI

struct EnterLocationView: View {
    //@Binding var currentLocation: String //for textfield binding
    @State var isShowSheet: Bool = false
    @StateObject var locationManager = LocationManager()
    @StateObject var currentLocationManager = CurrentLocationManager()
    @State var isCheckedArray: String = ""
    
    var body: some View {
        Form {
            Section {
                Text("Enter a convenient place for you to recycle or donate your clothes.")
                    .font(.system(size: 20, weight: .regular, design: .serif))
            }
            Section {
                Button {
                    isShowSheet = true
                } label: {
                    HStack {
                        Text(currentLocationManager.currentLocations.last!) //get the last element of the array, aka the most updated one
                            .foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.blue)
                            .frame(width: 24, height: 24, alignment: .trailing)
                    }
                }
            } header: {
                Text("CURRENTLY SET TO")
            }
            Section {
                List {
                    ForEach($locationManager.locations, id: \.self) { $location in
                        Button {
                            isCheckedArray = location
                            currentLocationManager.currentLocations.append(location)
                        } label: {
                            HStack {
                                Text(location)
                                    .foregroundColor(Color.black)
                                Spacer()
                                Image(systemName: isCheckedArray == location ? "checkmark" : "")
                                    .foregroundColor(Color.blue)
                            }
                        }
                        .listRowBackground(isCheckedArray == location ? Color.gray .opacity(0.2) : Color.white)
                    }
                    .onDelete { indexSet in
                        locationManager.locations.remove(atOffsets: indexSet )
                    }
                    .onMove { indices, newOffset in
                        locationManager.locations.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
            } header: {
                Text("PAST LOCATIONS SET")
            }
            Spacer()
        }
        .sheet(isPresented: $isShowSheet) {
            LocationTextField(locations: $locationManager.locations) //or is this $currentLocation?
        }
        .toolbar {
            ToolbarItem {
                EditButton()
            }
        }
    }
}

struct LocationTextField: View {
    
    //@Binding var pastLocations: [Location]
//    @ObservedObject var currentLocationManager = CurrentLocationManager() //for storing past locations ^
//    @ObservedObject var locationManager = LocationManager()
    
    @Environment(\.presentationMode) var presentationMode
    @State var location = "" //for the text field
    @Binding var locations: [String]
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Text("Location")
                        .bold()
                    Spacer(minLength: 100)
                    Button {
//                        locationManager.locations.append(location) //input from text field
//                        currentLocationManager.currentLocations.append(location)
                        locations.append(location)
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
