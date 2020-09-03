//
//  ContentView.swift
//  PickersSwiftUI
//
//  Created by Никита Пережогин on 03.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var section = 0
    @State var secondSection = 0
    @State var isOn = false
    
    var settingsTime = ["5 min", "10 min", "15 min"]
    var secondSettingsTime = ["5 min", "10 min", "15 min"]
    
    var body: some View {
        NavigationView{
            Form{
                Picker(
                    selection: $section,
                    label: Text("Time settings")) {
                        ForEach(0..<settingsTime.count){
                            Text(self.settingsTime[$0])
                        }
                }
                
                Toggle(
                    isOn: $isOn,
                    label: {
                        Text("Avia")
                            .foregroundColor( isOn ? Color.orange : Color.gray)
                })
                
                Picker(
                    selection: $secondSection,
                    label: Text("Second time settings")) {
                        
                        ForEach(0..<secondSettingsTime.count){
                            Text(self.secondSettingsTime[$0])
                        }
                        
                }
                
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
