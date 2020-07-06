//
//  ContentView.swift
//  Road
//
//  Created by ddas on 17.05.2020.
//  Copyright © 2020 ddas. All rights reserved.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State var itemTitle = ""
    @State var itemPhoto = ""
    @State var itemType = ""
    @State var itemCity = ""
    @State var itemLatitude = ""
    @State var itemLongitude = ""
    @State var itemDescription = ""
    
    var body: some View {
        ScrollView {
            VStack{
                MapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                CircleImage()
                    .offset(y:-130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.title)
                    HStack{
                        Text("Location")
                            .font(.subheadline)
                        Spacer()
                        Text("Type place")
                            .font(.subheadline)
                    }
                    Spacer()
                        Text("""
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                Quas consectetur adipiscing elit audiam virtute ut, case utamur fuisset eam ut, iisque accommodare an eam. Reque blandit qui eu, cu vix nonumy volumus. Legendos intellegam id usu, vide oporteat vix eu, id illud principes has. Nam tempor utamur gubergren no.

                Audiam virtute ut, case utamur fuisset eam ut, iisque accommodare an eam. Reque blandit qui eu, cu vix nonumy volumus. Legendos intellegam id usu, vide oporteat vix eu, id illud principes has. Nam tempor utamur gubergren no. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                Nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                """)
                                        
                                    
                }
                .padding()
                VStack {
                    TextField("Name", text: $itemType).textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Age", text: $itemTitle).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion : 1)
                        do
                        {
                            let realm = try Realm(configuration: config)
                            let result = realm.objects(dataItem.self)
                            print(result)
                            print(Realm.Configuration.defaultConfiguration)

                        }
                        catch{
                            print(error.localizedDescription)
                        }
                        
                    }) {
                        Text("display")
                    }
                    
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion : 1)
                        do
                        {
                            let realm = try Realm(configuration: config)
                            let newdata = dataItem()
                            newdata.itemType = self.itemType
                            newdata.itemTitle = self.itemTitle
                            try realm.write({
                                
                                realm.add(newdata)
                                print("success")
                                
                            })
                        }
                        catch{
                            print(error.localizedDescription)
                        }
                        
                    }) {
                        Text(/*@START_MENU_TOKEN@*/"Save"/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
