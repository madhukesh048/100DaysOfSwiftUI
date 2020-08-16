//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Madhukesh on 15/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingAlert = false
    
    static var types = ["Personal","Business"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name",text: $name)
                
                Picker("Type",selection: $type){
                    ForEach(Self.types,id:\.self){
                        Text($0)
                    }
                }
                
                TextField("Amount",text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $showingAlert){
                Alert(title: Text("Error"),message: Text("Invalid input"),dismissButton: .default(Text("Continue")))
            }
        .navigationBarTitle("Add Expense")
        .navigationBarItems(trailing: Button("Save") {
            if let actualAmount = Int(self.amount) {
                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            }else{
                self.showingAlert = true
            }
        })
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
