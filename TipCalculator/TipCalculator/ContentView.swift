//
//  ContentView.swift
//  TipCalculator
//
//  Created by Никита Пережогин on 08.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    private let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<25){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Сколько чаевых хотите отсавить?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                        
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(footer: Text("Должен каждый")){
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
                
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
