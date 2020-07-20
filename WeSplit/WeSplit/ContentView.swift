//
//  ContentView.swift
//  WeSplit
//
//  Created by Madhukesh on 20/07/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry","Ron","Hermoine"]
    @State private var selectedStudent = 0
    @State private var name = ""
    
    var body: some View {
        VStack{
            Picker("Select your student",selection: $selectedStudent){
                ForEach(0..<students.count){
                    Text(self.students[$0])
                }
            }
            Text("You chose: \(students[selectedStudent])")
            
                Form{
                    TextField("Enter your Name",text: $name)
                    Text("Your name is \(name)")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
