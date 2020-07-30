//
//  ContentView.swift
//  BetterRest
//
//  Created by Madhukesh on 30/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepHours = 8.0
    @State private var wakeUp = Date()
    var body: some View {
        VStack(spacing:20){
            Form{
                Stepper(value:$sleepHours, in:4...12, step: 0.25){
                    Text("\(sleepHours,specifier: "%g") Hours")
                }
                DatePicker("Please enter the Data",selection: $wakeUp,in:Date()...)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
