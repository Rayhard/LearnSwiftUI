//
//  ContentView.swift
//  ToggleElement
//
//  Created by Никита Пережогин on 03.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isOnToggle = false
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    VStack{
                        Text("One")
                        Text("Two")
                        Spacer().frame(height: 300)
                    }
                    .padding()
                    Spacer()
                }
                
                contentView
            }
            
            Toggle(
                isOn: $isOnToggle,
                label: {
                    Text("Settings")
            })
                .padding()
        }
        .animation(
            .spring(
                response: 0.5,
                dampingFraction: 0.7,
                blendDuration: 0.3))
    }
    
    var contentView: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.yellow)
                .offset(x: self.isOnToggle ? 100 : 0)
            
            Text("Some text")
                .offset(x: isOnToggle ? 100 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
