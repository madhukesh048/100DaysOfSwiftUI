//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Madhukesh on 24/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var animationAngle = Angle.degrees(0)
    @State private var offset = CGSize.zero
    @State private var opacity = 1.0
    
    struct FlagImage: View{
        var text: String
        var body: some View{
            Image(text).renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                .shadow(color:.black,radius: 2)
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30){
                VStack(){
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
              ForEach(0 ..< 3) { number in
                                 Button(action: {
                                     self.flagTapped(number)
                                 }) {
                                    FlagImage(text: self.countries[number])
                                 }
                                 .rotation3DEffect(number == self.correctAnswer ? self.animationAngle : .degrees(0), axis: (x: 0, y: 1, z: 0))
                                 .offset(self.offset)
                                 .opacity(number != self.correctAnswer ? self.opacity : 1)
                             }
                Text("Your Score is \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                 self.opacity = 1
            })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct! Good job."
            score += 1
         withAnimation(.easeInOut(duration: 1)) {
                       self.animationAngle += .degrees(360)
                   }
                   self.animationAngle = .degrees(self.animationAngle.degrees.truncatingRemainder(dividingBy: 360))
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
            self.offset = CGSize(width: 10, height: 0)
                       withAnimation(.interpolatingSpring(stiffness: 2000, damping: 10)) {
                           self.offset = .zero
                       }
        }
        withAnimation(.easeInOut) {
                   self.opacity = 0.25
               }

        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

