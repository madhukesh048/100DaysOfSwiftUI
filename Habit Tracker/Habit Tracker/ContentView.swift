//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Madhukesh on 25/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
             List(0..<activities.activities.count,id:\.self) { index in
                   NavigationLink(destination:HabitDetailView(activities: self.activities, index: index)) {
                       HStack {
                           VStack(alignment: .leading) {
                               Text(self.activities.activities[index].name)
                                   .font(.headline)
                               Text(self.activities.activities[index].description)
                           }
                           Spacer()
                       }
                   }
                }
            .navigationBarTitle("Habit Tracker",displayMode: .inline)
            .navigationBarItems(trailing: addButton())
            .sheet(isPresented:$showingSheet){AddHabit(activities: self.activities)}
        }
    }
  
    
    func addButton() -> some View{
        Button(action: {
            self.showingSheet = true
        }, label: {Image(systemName: "plus")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
