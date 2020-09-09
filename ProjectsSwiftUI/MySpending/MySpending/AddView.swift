//
//  AddView.swift
//  MySpending
//
//  Created by Никита Пережогин on 09.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var ammount = ""
    
    let types = ["Personal", "Bussines"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Название", text: $name)
                
                Picker(selection: $type, label: Text("Тип")) {
                    ForEach(self.types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Стоимость", text: $ammount)
                    .keyboardType(.numberPad)
            }
                
            .navigationBarTitle("Добавить")
            .navigationBarItems(trailing: Button("Сохранить"){
                if let actualAmmount = Int(self.ammount){
                    self.expenses.items.append(ExpenseItem(name: self.name,
                                                           type: self.type,
                                                           amount: actualAmmount))
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
