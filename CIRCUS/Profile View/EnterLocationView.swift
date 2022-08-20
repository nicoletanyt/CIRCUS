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
                    Text(currentLocationManager.currentLocations.last!) //get the last element of the array, aka the most updated one
                        .foregroundColor(Color.black)
                }
            } header: {
                Text("CURRENTLY SET TO")
            }
            Section {
                List {
//                    Button {
//                        locationManager.locations.append("NIL")
//                    } label: {
//                        Text("NIL") //NIL button, aka default location
//                            .foregroundColor(Color.black)
//                    }
                    ForEach($locationManager.locations, id: \.self) { $location in
                        Button {
                            currentLocationManager.currentLocations.append(location)
                        } label: {
                            Text(location)
                                .foregroundColor(Color.black)
                        }
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
