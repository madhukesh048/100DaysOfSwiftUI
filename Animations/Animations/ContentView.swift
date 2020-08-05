//
//  ContentView.swift
//  Animations
//
//  Created by Madhukesh on 05/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationAngle = 0.0
    
    var body: some View {
        print(animationAmount)
        return VStack{
            Stepper("Scale Amount",value: $animationAmount.animation(
            Animation.easeInOut(duration: 1)
                   .repeatCount(3, autoreverses: true)),in:1...10)
            Spacer()
            Button("Tap Me"){
                self.animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
//            .overlay(
//                Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeInOut(duration: 2)
//                    .repeatForever(autoreverses: false)
//                )
//            )
//            .onAppear {
//                self.animationAmount = 2
//            }
            Spacer()
            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)){
                     self.animationAngle += 360
                    }
                   }
                   .padding(50)
                   .background(Color.green)
                   .foregroundColor(.white)
                   .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAngle), axis: (x:0,y:1,z:0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
