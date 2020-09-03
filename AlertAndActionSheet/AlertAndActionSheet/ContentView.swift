//
//  ContentView.swift
//  AlertAndActionSheet
//
//  Created by Никита Пережогин on 03.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isErrorAlert = false
    @State var isErrorAction = false
    
    var body: some View {
        
        VStack{
            alertButton.padding().background(Color.yellow)
            
            actionSheetButton.padding().background(Color.green)
        }
        
    }
    
    var alertButton: some View {
        Button(
            action: {
                self.isErrorAlert = true
        },
            label: {
                Text("Alert")
        })
            .alert(
                isPresented: $isErrorAlert,
                content: {
                    Alert(
                        title: Text("It is Alert"),
                        message: Text("Realy"),
                        primaryButton: .cancel(),
                        secondaryButton: .destructive(
                            Text("Yes"),
                            action: {
                                print("Alert action")
                        }))
            })
    }
    
    var actionSheetButton: some View {
        Button(
            action: {
                self.isErrorAction = true
        },
            label: {
                Text("ActionSheet")
        }).actionSheet(
            isPresented: $isErrorAction,
            content: {
                ActionSheet(
                    title: Text("It is ActionSheet"),
                    message: Text("Realy"),
                    buttons: [
                        .cancel(),
                        .default(Text("Просто текст")),
                        .destructive(
                            Text("Текст с действием"),
                            action: {
                                print("ActionSheet action")
                        })
                ])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
