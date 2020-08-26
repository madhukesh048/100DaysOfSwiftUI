//
//  AddHabit.swift
//  Habit Tracker
//
//  Created by Madhukesh on 25/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct AddHabit: View {
    @State private var name = ""
    @State private var description = ""

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var showingAlert = false
       
   var body: some View {
       NavigationView {
           Form {
               TextField("Activity Name: ",text:$name)
               TextField("Description: ",text:$description)
                   .keyboardType(.numberPad)
           }
           .navigationBarTitle("Add Activity")
           .navigationBarItems(trailing:
               Button("Save") {
                   if self.name != "" && self.description != ""{
                       let activity = ActivityModel(name: self.name, description: self.description, count:1)
                       self.activities.activities.append(activity)
                       self.presentationMode.wrappedValue.dismiss()
                   }
                   else{
                       self.showingAlert.toggle()
                   }
               }
           )
       }
       .alert(isPresented: $showingAlert) {
           Alert(title: Text("Oops"), message: Text("Please enter the correct activity/description "), dismissButton: .default(Text("OK")))
       }
   }
}
