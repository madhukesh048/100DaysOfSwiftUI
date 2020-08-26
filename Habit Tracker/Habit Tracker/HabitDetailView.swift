//
//  HabitDetailView.swift
//  Habit Tracker
//
//  Created by Madhukesh on 26/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct HabitDetailView: View {
    @ObservedObject var activities: Activities
    var index: Int
    
    var body: some View {
          NavigationView {
              VStack {
                  Text("Activity Description: \(self.activities.activities[index].description)")
                  .font(.headline)
                  Spacer()
              }
          }
        .navigationBarTitle(Text(self.activities.activities[index].name),displayMode: .inline)
    }
}

