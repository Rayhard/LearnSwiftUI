//
//  ContentView.swift
//  AcitivityViewAndUIViewRepresentable
//
//  Created by Никита Пережогин on 04.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isSharePresented = false
    
    var body: some View {
        
        Button("Share") {
            self.isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented, content: {
            ActivityView(activityItems: ["Message test"])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
