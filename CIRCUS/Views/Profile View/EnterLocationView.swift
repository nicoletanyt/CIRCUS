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
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var uservm: UserDataStore
    
    var body: some View {
        ZStack {
            Form {
                Text("Enter a convenient place for you to recycle or donate your clothes.")
                    .font(.headline)
                Section {
                    Text(uservm.user.currentLocation)
                        .foregroundColor(Color.black)
                } header: {
                    Text("Currently Set To")
                }
                Section {
                    List {
                        ForEach(uservm.user.locations, id: \.self) { location in
                            Button {
                                uservm.user.currentLocation = location
                                uservm.saveUserInformation()
                            } label: {
                                Text(location)
                                    .foregroundColor(Color.black)
                                    .padding(.vertical)
                            }
                        }
                        .onDelete { indexSet in
                            uservm.user.locations.remove(atOffsets: indexSet)
                            uservm.saveUserInformation()
                        }
                    }
                } header: {
                    Text("Past Locations")
                }
            }
            .onAppear(perform: uservm.loadUserInformation)
            .navigationTitle("Locations")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowSheet) {
                LocationTextField()
            }
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .background(Image(colorScheme == .light ? "APP-BACKGROUND-LIGHT" : "APP-BACKGROUND-DARK")
            .resizable())
    }
}

struct LocationTextField: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var location = "" //for the text field
    @EnvironmentObject var uservm: UserDataStore
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Your Location", text: $location)
                    .padding()
                Spacer()
            }
            .navigationTitle("New Location")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        uservm.user.locations.append(location)
                        uservm.saveUserInformation()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(location == "")
                }
            }
        }
    }
}
struct EnterLocationView_Previews: PreviewProvider {
    static var previews: some View {
        EnterLocationView()
            .environmentObject(UserDataStore())
    }
}
