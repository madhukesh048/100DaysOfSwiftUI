//
//  AddHabit.swift
//  Habit Tracker
//
//  Created by Madhukesh on 25/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var nameText: String = ""
    @State private var descriptionText: String = ""
    
    var body: some View {
        Form{
            HStack {
                  Spacer()
                  Button(action: {
                      self.presentationMode.wrappedValue.dismiss()
                  }) {
                      Text("Cancel")
                          .foregroundColor(.red)
                  }
              }
              .padding(.vertical)
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit()
    }
}
