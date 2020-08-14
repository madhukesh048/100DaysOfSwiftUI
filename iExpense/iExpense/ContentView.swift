//
//  ContentView.swift
//  iExpense
//
//  Created by Madhukesh on 14/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name:String
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet"){
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView(name:"Madhukesh")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
