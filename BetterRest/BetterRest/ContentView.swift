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
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    let coffeeCups = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            NavigationView {
                    Form {
                        Section{
                            Text("When do you want to wake up?")
                                                   .font(.headline)
                            DatePicker("Please enter the Time",selection: $wakeUp,displayedComponents: .hourAndMinute).labelsHidden()
                        }
                        Section{
                            Text("Desired amount of sleep")
                            .font(.headline)
                            Stepper(value:$sleepHours, in:4...12, step: 0.25){
                                Text("\(sleepHours,specifier: "%g") Hours")
                            }
                        }
                        Section{
                            Text("Daily coffee intake")
                                .font(.headline)
                            Picker("\(coffeeCups[coffeeAmount]) cup/cups",selection: $coffeeAmount){
                                ForEach(0..<coffeeCups.count){
                                    Text("\(self.coffeeCups[$0])")
                                }
                            }
    //                        Stepper(value:$coffeeAmount, in: 1...20){
    //                            if coffeeAmount == 1{
    //                                Text("1 cup")
    //                            }else{
    //                                Text("\(coffeeAmount) cups")
    //                            }
    //                        }
                        }
                        Section{
                            Text("Your ideal bedtime is \(alertMessage)")
                                .font(.custom("\(alertMessage)", size: 24))
                                .foregroundColor(.blue)
                        }
                    }
                .navigationBarTitle("BetterRest")
                .navigationBarItems(trailing:
                    Button(action: calculateBedtime) {
                        Text("Calculate")
                    }
                )
//                .alert(isPresented: $showingAlert) {
//                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//                }
            }
        }
    }
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime(){
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepHours, coffee: Double(coffeeAmount))
             let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
         showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
