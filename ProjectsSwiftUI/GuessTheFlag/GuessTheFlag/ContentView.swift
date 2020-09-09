//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Никита Пережогин on 09.09.2020.
//  Copyright © 2020 Nikita Perezhogin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled()
    @State private var currentAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .white]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack{
                    Text("Выбери флаг:")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Text(countries[currentAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    },
                           label: {
                            Image(self.countries[number])
                                .renderingMode(.original)
                                .frame(width: 250, height: 125)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                                .shadow(color: .black, radius: 2)
                    })
                }
                
                Text("Общий счет: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
        }.alert(isPresented: $showingScore,
                content: {
                    Alert(title: Text(scoreTitle),
                          message: Text("Общий счет: \(score)"),
                          dismissButton: .default(Text("Продолжить")){
                            self.askQuestion()
                        })
        })
    }
    
    func askQuestion() {
        countries.shuffle()
        currentAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int) {
        if number == currentAnswer{
            scoreTitle = "Правильный ответ"
            score += 1
        } else {
            scoreTitle = "Не правильный ответ! Это флаг \(countries[number])"
            score -= 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
