//
//  ContentView.swift
//  Edutainment
//
//  Created by Madhukesh on 08/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tables = 4
    @State private var noOfQuestions = 5
    @State private var isGameOn = false
    
    let questions = ["5","10","20","All"]
    
    var body: some View {
        Group{
            NavigationView{
                VStack(spacing:20){
                    Section(header:Text("Choose tables")){
                        Stepper(value:$tables, in: 1...12){
                            Text("Upto \(tables)")
                        }
                        
                    }
                    Section(header:Text("Choose number of questions")){
                        Picker(selection:$noOfQuestions, label:Text("")){
                            ForEach(0..<self.questions.count){ index in
                                Text("\(self.questions[index])").tag(index)
                            }
                        }
                         .pickerStyle(SegmentedPickerStyle())
                    }
                    NavigationLink(destination:GameView(),isActive:$isGameOn){
                        Button(action:{
                            self.calculateNoOfQuestions()
                            print(self.noOfQuestions)
                            self.isGameOn = true
                        }){
                            Text("Start Game")
                            .padding(.all, 12)
                            .foregroundColor(.white)
                            .background(Color.black)
                        }
                    }
                    Spacer()
                .navigationBarTitle("Edutainment")
                }
            }
        }
    }
    func calculateNoOfQuestions(){
        switch noOfQuestions {
           case 0 :
               noOfQuestions = Int(self.questions[0]) ?? 5
           case 1 :
               noOfQuestions = Int(self.questions[1]) ?? 5
           case 2 :
               noOfQuestions = Int(self.questions[2]) ?? 5
           case 3 :
               noOfQuestions = 100
           default:
               noOfQuestions = 5
           }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
