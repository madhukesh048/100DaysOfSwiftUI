//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Madhukesh on 29/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var totalQuestions = 0
    @State private var score = 0
    @State private var showingScore = false
    @State private var moveChoice = Int.random(in: 0...2)
    @State private var wlChoice = Bool.random()
    
    let moves = ["Rock", "Paper", "Scissors"]
    struct CapsuleText: View {
        var text: String

        var body: some View {
            Text(text)
                .font(.subheadline)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())        }
    }
    struct CustomText: View {
         var text: String

         var body: some View {
             Text(text)
                .font(.title)
                 .padding()
                 .foregroundColor(.white)
                }
        }
    
    var body: some View {
        ZStack{
             LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
             VStack(spacing:20){
                CustomText(text:"Your Score is \(score)")
                wlChoice ? CustomText(text:"You must: Win"):CustomText(text:"You must: Lose")
                 HStack{
                    ForEach(0..<moves.count){ number in
                        Button(action:{
                            self.flagTapped(number)
                        }){
                            CapsuleText(text: self.moves[number])
                        }
                    }
                }
            }
            .alert(isPresented: $showingScore) {
                      Alert(title: Text("Game Over"), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                      })
                  }
        }
    }
    func flagTapped(_ number: Int) {
        totalQuestions += 1
        print("Question Number :\(totalQuestions)")
        print("User Choice: \(number)")
        print("Move Choice: \(moveChoice)")
        print("Win/Lose: \(wlChoice)")
        if(moveChoice == 0 && wlChoice){
            if(number == 1){
                score += 1
            }else{
                score -= 1
            }
        }else if(moveChoice == 0 && !wlChoice){
            if(number == 2){
                score += 1
            }else{
                score -= 1
            }
        }else if(moveChoice == 1 && wlChoice){
            if(number == 2){
                score += 1
            }else{
                score -= 1
            }
        }else if(moveChoice == 1 && !wlChoice){
            if(number == 0){
                score += 1
            }else{
                score -= 1
            }
        }else if(moveChoice == 2 && wlChoice){
            if(number == 0){
                score += 1
            }else{
                score -= 1
            }
        }else if(moveChoice == 2 && !wlChoice){
            if(number == 1){
                score += 1
            }else{
                score -= 1
            }
        }
         nextRound()
      }
    
    func nextRound() {
        if(totalQuestions == 10){
            showingScore = true
        }else{
            wlChoice = Bool.random()
            moveChoice = Int.random(in: 0...2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
