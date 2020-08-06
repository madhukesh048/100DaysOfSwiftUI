//
//  ContentView.swift
//  Animations
//
//  Created by Madhukesh on 05/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI


struct CornerRotateModifier : ViewModifier{
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition{
    static var pivot: AnyTransition{
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationAngle = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        print(animationAmount)
        return VStack{
            HStack(spacing:0){
                ForEach(0..<letters.count){ num in
                    Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
                }
                
            }
            .gesture(
                DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
                )
                
//            Stepper("Scale Amount",value: $animationAmount.animation(
//            Animation.easeInOut(duration: 1)
//                   .repeatCount(3, autoreverses: true)),in:1...10)
//            Spacer()
//            Button("Tap Me"){
//                self.animationAmount += 1
//            }
//            .padding(30)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
            Spacer()
            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 1)){
                     self.animationAngle += 360
                    }
                   }
                   .padding(30)
                   .background(Color.green)
                   .foregroundColor(.white)
                   .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAngle), axis: (x:0,y:1,z:0))
            Spacer()
            Button("Tap Me"){
                self.enabled.toggle()
            }
                .frame(width: 80, height: 80)
                .background(enabled ? Color.blue : Color.red)
                .animation(nil)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1))
                
            Spacer()
//            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 80, height: 80)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
//                    .onEnded { _ in withAnimation(.spring()) {
//                        self.dragAmount = .zero
//                    } }
//            )
//            .padding(30)
            Button("Tap Me") {
              withAnimation {
                  self.isShowingRed.toggle()
              }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                .padding(30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
