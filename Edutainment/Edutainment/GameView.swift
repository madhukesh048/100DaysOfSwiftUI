//
//  GameView.swift
//  Edutainment
//
//  Created by Madhukesh on 08/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Binding var numberOfQuestions: Int
    var tables = 1
    @State private var multiplyBy = Int.random(in: 1...10)
    @State private var userAnswer = "0"

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack{
               VStack(spacing:40) {
                HStack(spacing:5) {
                         ForEach(1...tables,id:\.self) {
                             Image("\($0)")
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width:30,height:30)
                         }
                     }
                     Image(systemName: "multiply")
                HStack(spacing:5) {
                         ForEach(1...multiplyBy,id:\.self) {
                             Image("\($0)")
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width:30,height:30)
                         }
                     }
                }
                .padding(20)
                VStack(spacing:20) {
                       TextField("Your Answer: ",text:$userAnswer)
                           .keyboardType(.numberPad)
                           .padding(20)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                       Button(action: {
                          //
                       }) {
                           Text("Submit")
                               .padding(.all, 12)
                               .foregroundColor(.white)
                               .background(Color.black)
                               .cornerRadius(10)
                    }
                }
            }
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(numberOfQuestions: '')
//    }
//}
