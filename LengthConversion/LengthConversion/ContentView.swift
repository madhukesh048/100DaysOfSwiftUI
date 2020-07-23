//
//  ContentView.swift
//  LengthConversion
//
//  Created by Madhukesh on 23/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputVal = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 2
        
    let units: [(unitName: String, conversionRate: Double)] = [("Mts", 1.0), ("Kms", 1000), ("Miles", 1_609.344), ("Foot", 0.3048),]
    
    var inputValue: Double {
        return Double(inputVal) ?? 0
    }
    
    var unitValue: Double {
        let unit = units[inputUnit]
        return inputValue * unit.conversionRate
    }
    
    var convertedValue: Double {
        let unit = units[outputUnit]
        return unitValue / unit.conversionRate
    }
    
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Enter Input Value", text:$inputVal)
                Section(header:Text("Select the input Unit")){
                    Picker("Select the input Unit",selection: $inputUnit){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0].unitName)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header:Text("Select the output Unit")){
                    Picker("Select the output Unit",selection: $outputUnit){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0].unitName)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Output Value")){
                    Text("\(convertedValue,specifier: "%.3f")")
                }
            }
            .navigationBarTitle("LengthConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
