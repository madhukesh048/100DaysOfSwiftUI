//
//  ContentView.swift
//  WordScramble
//
//  Created by Madhukesh on 02/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let people = ["Ram","Lakshman","Sita","Hanuman"]
    var body: some View {
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        if let fileUrl = Bundle.main.url(forResource: "some-file", withExtension:  "txt"){
            //we found the file in our bundle
            if let fileContents = try?String(contentsOf: fileUrl){
                //we loaded file into string
            }
        }
       return List(people,id: \.self){
            Text($0)
        .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
