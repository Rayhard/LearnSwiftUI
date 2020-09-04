//
//  ContentView.swift
//  SegmentSwiftUI
//
//  Created by Никита Пережогин on 04.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    var body: some View {
        VStack {
            Text("Cross - \(company[segmentIndex])")
                .font(Font.system(.title))
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .offset(x: CGFloat(offsetX))
                
                Image(sneakers[segmentIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: CGFloat(offsetX))
            }
            .animation(.spring())
            
            Picker(selection: Binding(
                get: { self.segmentIndex },
                set: { newValue in
                    self.segmentIndex = newValue
                    self.offsetX = -500
                    self.moveBack()
            }),
                   label: Text("")) {
                    ForEach(0..<company.count){
                        Text(self.company[$0]).tag($0)
                    }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer().frame(height: 150)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.offsetX = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
