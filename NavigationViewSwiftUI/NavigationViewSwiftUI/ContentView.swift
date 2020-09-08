//
//  ContentView.swift
//  NavigationViewSwiftUI
//
//  Created by Никита Пережогин on 08.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userBuy = UserBuy()
    
    let coffe = "Кофе"
    let tea = "Чай"
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 30){
                
                Text("Вы выбрали = \(userBuy.caps) шт")
                
                Text("Что желаете?")
                
                NavigationLink(destination: DetailView(text: coffe)) {
                    Text(coffe)
                }
                
                NavigationLink(destination: DetailView(text: tea)) {
                    Text(tea)
                }
            }
                
            .navigationBarTitle("Menu")
        }
            
        .environmentObject(userBuy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
