//
//  DetailView.swift
//  NavigationViewSwiftUI
//
//  Created by Никита Пережогин on 08.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Купить \(text) \(userBuy.caps) шт")
                
                .navigationBarItems(leading:
                    Button("Назад"){
                        self.presentation.wrappedValue.dismiss()
                    },
                                    trailing:
                    HStack{
                        Button("-"){
                            guard self.userBuy.caps > 0 else { return }
                            self.userBuy.caps -= 1
                        }
                        
                        Button("+"){
                            self.userBuy.caps += 1
                        }

                    }
            )
            
        }
            
        .navigationBarBackButtonHidden(true)
        
        .onAppear(){
            self.userBuy.caps = 0
        }
    }
}

