//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Madhukesh on 24/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert"){
            self.showAlert = true
        }
        .alert(isPresented: $showAlert){
        Alert(title: Text("Hello"), message: Text("This is alert msg"), dismissButton: .default(Text("Ok")))
        }
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

