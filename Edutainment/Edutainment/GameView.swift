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

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
           HStack(spacing:40) {
                 VStack {
                     ForEach(1...tables,id:\.self) {
                         Image("\($0)")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width:50,height:50)
                     }
                 }
                 Image(systemName: "multiply")
                 VStack {
                     ForEach(1...multiplyBy,id:\.self) {
                         Image("\($0)")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width:50,height:50)
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
