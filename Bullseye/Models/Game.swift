//
//  Game.swift
//  Bullseye
//
//  Created by Nancy Hernandez Yanez on 19-04-23.
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderBoardEntry] = []
  
  init(loadTestdata: Bool = false) {
    if loadTestdata {
      addToLeaderBoard(score: 100)
      addToLeaderBoard(score: 80)
      addToLeaderBoard(score: 200)
      addToLeaderBoard(score: 50)
      addToLeaderBoard(score: 20)
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  mutating func startNewRound(points: Int) {
    addToLeaderBoard(score: points)
    score += points
    round += 1
    target = Int.random(in: 1...100)

  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderBoard(score: Int) {
    leaderboardEntries.append(LeaderBoardEntry(score: score, date: Date()))
    leaderboardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }
}

struct LeaderBoardEntry {
  let score: Int
  let date: Date
}
