//
//  ContentView.swift
//  WordScramble
//
//  Created by Madhukesh on 02/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter the word",text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWords,id:\.self){
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                Text("Your Score : \(score)")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                .padding()
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarItems(trailing: Button(action:startGame){
                Text("Restart")
            })
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isSame(word: answer) else{
            wordError(title: "Words not possible", message:     "Cannot be same as rootword.")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }
        
        guard isSmallWord(word: answer)else {
            wordError(title: "Word not possible", message: "word cannot be less than 3 letters")
            return
        }
        
        usedWords.insert(answer, at: 0)
        score += 1
        newWord = ""
    }
    
    func startGame() {
        usedWords.removeAll()
        score = 0
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension:  "txt"){
            if let startWords = try?String(contentsOf: startWordURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word:String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word:String) -> Bool {
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                    tempWord.remove(at:pos)
            }else{
                return false
            }
        }
           return true
    }
    
    func isReal(word:String) -> Bool {
        let checker = UITextChecker()
          let range = NSRange(location: 0, length: word.utf16.count)
          let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

          return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isSame(word:String) -> Bool{
        if (word.lowercased() == rootWord.lowercased()){
            return false
        }else{
            return true
        }
    }
    
    func isSmallWord(word:String) -> Bool {
        if(word.count < 3){
            return false
        }else{
            return true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
