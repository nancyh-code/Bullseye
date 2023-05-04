//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Nancy Hernandez Yanez on 22-04-23.
//

import SwiftUI

struct LeaderBoardView: View {
  @Binding var leaderboardIsShowing : Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices, id: \.self) { index in
              let leaderboardEntry = game.leaderboardEntries[index]
              RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardIsShowing : Bool
  
  var body: some View {
    ZStack {
      HStack {
        BigBoldText(text: "Leaderboard")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsShowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding([.horizontal, .top])
  }
}

struct LabelView: View {
  
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLenght)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}


struct LeaderBoardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestdata: true))
  static var previews: some View {
    LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewInterfaceOrientation(.landscapeRight)
    LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
  }
}
