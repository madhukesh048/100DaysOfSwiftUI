//
//  GameView.swift
//  Edutainment
//
//  Created by Madhukesh on 08/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        Text("Hello, Second View!")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color.blue)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
