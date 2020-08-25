//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Madhukesh on 25/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            Text("List")
            .navigationBarTitle("Habit Tracker",displayMode: .inline)
            .navigationBarItems(trailing: addButton())
            .sheet(isPresented:$showingSheet){AddHabit()}
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
